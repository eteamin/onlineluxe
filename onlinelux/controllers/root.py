# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, lurl, session, abort, request, redirect, tmpl_context, config
from tg.exceptions import HTTPFound
from tgext.admin.tgadminconfig import BootstrapTGAdminConfig as TGAdminConfig
from tgext.admin.controller import AdminController
from sqlalchemy.orm import joinedload
from sqlalchemy.exc import IntegrityError

from onlinelux import model
from onlinelux.model import DBSession, Article, Product, Purchase, User, Comment
from onlinelux.lib.base import BaseController
from onlinelux.lib.helpers import dash_for_space
from onlinelux.lib.zarinpal_client import ZarinpalClient
from onlinelux.lib.telegram_bot import TelegramNotifier
from onlinelux.controllers.error import ErrorController
from onlinelux.controllers.admin import Area51Controller


__all__ = ['RootController']


class RootController(BaseController):
    admin = AdminController(model, DBSession, config_type=TGAdminConfig)
    area51 = Area51Controller()

    error = ErrorController()

    def _before(self, *args, **kw):
        tmpl_context.project_name = "onlinelux"

    @expose('onlinelux.templates.index')
    def index(self):
        latest = DBSession.query(Product).order_by(Product.id.desc()).limit(16).all()
        articles = DBSession.query(Article).order_by(Article.id.desc()).limit(2).all()
        top = []
        return dict(latest=latest, articles=articles, top=top, title='آنلاین لوکس - خرید بدلیجات')

    @expose('onlinelux.templates.product')
    def p(self, id, title):
        product = DBSession.\
            query(Product).\
            options(joinedload('comments.tg_user')).\
            filter(Product.id == id).\
            one_or_none()
        if not product:
            abort(404)

        return dict(
            product=product,
            title=u'آنلاین لوکس - {}'.format(dash_for_space(product.name)),
            description=product.description
        )

    @expose('onlinelux.templates.subcategory')
    def s(self, id, title, **kwargs):
        page = kwargs.get('page') or 1
        offset = (int(page) - 1) * 16
        result = DBSession.\
            query(Product).\
            filter(Product.subcat_id == id).\
            filter(Product.quantity > 0)

        products = result.order_by(Product.price.desc()).offset(offset).limit(16).all()
        return dict(
            total=len(result.all()),
            products=products,
            title=u'آنلاین لوکس محصولات دسته بندی - {}'.format(dash_for_space(title)),
            subcat_title=title,
            subcat_id=id,
            page=page
        )

    @expose('onlinelux.templates.magazine')
    def magazine(self, **kwargs):
        page = kwargs.get('page')
        offset = (page - 1) * 9 if page else 0
        articles = DBSession.\
            query(Article).\
            order_by(Article.id.desc()).\
            offset(offset).\
            all()
        top = DBSession.query(Article).order_by(Article.views.desc()).limit(3).all()
        return dict(articles=articles, top=top, title=u'آنلاین لوکس - مجله')

    @expose('onlinelux.templates.article')
    def a(self, a_id, a_title):
        article = DBSession.query(Article).filter(Article.id == a_id).one_or_none()
        if not article:
            abort(404)
        related = DBSession.\
            query(Article).\
            filter(Article.topic_id == article.topic_id).\
            order_by(Article.id.desc()).\
            limit(5).\
            all()
        article.views = Article.views + 1
        DBSession.flush()
        return dict(
            related=related,
            article=article,
            title=u'مجله آنلاین لوکس - {}'.format(dash_for_space(article.title))
        )

    @expose('onlinelux.templates.subcategory')
    def search(self, query, **kwargs):
        page = kwargs.get('page') or 1
        offset = (int(page) - 1) * 16
        result = DBSession. \
            query(Product). \
            filter(Product.name.contains(query)).\
            filter(Product.quantity > 0)

        products = result.order_by(Product.price.desc()).offset(offset).limit(16).all()
        return dict(
            products=products,
            title=u'آنلاین لوکس - نتایج جستجوی {}'.format(dash_for_space(query)),
            page=page,
            total=len(result.all()),
            query=query
        )

    @expose('onlinelux.templates.purchases')
    def purchases(self):
        purchases = DBSession.query(Purchase).filter(Purchase.user_id == User.current().user_id).all()
        return dict(purchases=purchases, title=u'آنلاین لوکس - سفارشات من')

    @expose('onlinelux.templates.basket')
    def basket(self):
        basket = DBSession.\
            query(Purchase).\
            filter(Purchase.user_id == User.current().user_id).\
            order_by(Purchase.id.desc()).\
            first()
        basket = basket if basket and basket.status == 'Selection' and len(basket.product) > 0 else None
        return dict(basket=basket, title=u'آنلاین لوکس - سبد خرید')

    @expose()
    def remove_from_basket(self, p_id):
        user = User.current()
        basket = DBSession. \
            query(Purchase). \
            filter(Purchase.user_id == user.user_id). \
            order_by(Purchase.id.desc()). \
            first()
        product = DBSession.query(Product).filter(Product.id == p_id).one_or_none()
        if basket and basket.status == 'Selection':
            if product in basket.product:
                basket.product.remove(product)
                tmp = basket.items
                del tmp[str(product.id)]
                basket.items = tmp
                DBSession.flush()
            redirect('/basket')

    @expose('json')
    def add_to_basket(self, p_id):
        user = User.current()
        basket = DBSession. \
            query(Purchase). \
            filter(Purchase.user_id == user.user_id). \
            order_by(Purchase.id.desc()). \
            first()
        product = DBSession.query(Product).filter(Product.id == p_id).one_or_none()
        if basket and basket.status == 'Selection':
            if product in basket.product:
                return dict()
            elif product not in basket.product:
                basket.product.append(product)
                tmp = basket.items
                tmp[product.id] = 1
                basket.items = tmp
                DBSession.flush()
            return dict()
        if not basket or basket.status != 'Selection':
            basket = Purchase(
                user_id=user.user_id,
                items={}
            )
            basket.set_uid()
            basket.product.append(product)
            tmp = basket.items
            tmp[product.id] = 1
            basket.items = tmp
            DBSession.add(basket)
            DBSession.flush()
            return dict()

    @expose()
    def change_count(self, product_id, value):
        user = User.current()
        basket = DBSession. \
            query(Purchase). \
            filter(Purchase.user_id == user.user_id). \
            order_by(Purchase.id.desc()). \
            first()
        product = DBSession.query(Product).filter(Product.id == product_id).one_or_none()
        tmp = basket.items
        if value == 'up':
            if int(basket.items.get(str(product.id))) >= int(product.quantity):
                return
            tmp[product_id] += 1
        elif value == 'down':
            if int(basket.items.get(str(product.id))) == 1:
                return
            tmp[product_id] += -1
        basket.items = tmp
        DBSession.flush()
        redirect('/basket')

    @expose('onlinelux.templates.finalize')
    def finalize(self, basket_id):
        user = User.current()
        basket = DBSession. \
            query(Purchase). \
            filter(Purchase.user_id == user.user_id). \
            filter(Purchase.id == basket_id). \
            order_by(Purchase.id.desc()). \
            first()
        if not basket or basket.status != 'Selection':
            redirect('/basket')
        return dict(user=user, basket_id=basket_id, title=u'آنلاین لوکس - تایید نهایی فاکتور {}'.format(basket.uid))

    @expose('json')
    def order_basket(self, **k):
        user = User.current()
        basket = DBSession. \
            query(Purchase). \
            filter(Purchase.user_id == user.user_id). \
            filter(Purchase.id == k.get('basket_id')).\
            order_by(Purchase.id.desc()). \
            first()
        if not basket or basket.status != 'Selection':
            redirect('/')

        dis_name, address, code, phone = k.get('name'), k.get('address'), k.get('code'), k.get('phone')
        user.display_name = dis_name
        user.postal_address = address
        user.postal_code = code
        user.phone_number = phone
        zp = ZarinpalClient(amount=basket.final_price, basket_uid=basket.uid)
        authority = zp.make()
        payment_url = config.get('payment')
        basket.authority = authority
        basket.status = 'Payment'
        try:
            DBSession.flush()
            return dict(ok=True, payment_url=payment_url, authority=authority)
        except IntegrityError:
            return dict(ok=False)

    @expose()
    def purchase_callback(self, **kwargs):
        authority = kwargs.get('Authority')
        status = kwargs.get('Status')
        user = User.current()
        if status == 'NOK':
            redirect('/basket')
        elif status == 'OK':
            basket = DBSession. \
                query(Purchase). \
                filter(Purchase.authority == authority). \
                filter(Purchase.user_id == user.user_id). \
                one_or_none()
            if basket and basket.status == 'Payment':
                zp = ZarinpalClient(basket.final_price, basket.uid)
                ref_id, status = zp.verify_payment(authority)
                if ref_id:
                    basket.ref_id = ref_id
                    basket.status = 'Preparing'
                    TelegramNotifier(basket, basket.final_price)
                    DBSession.flush()
                else:
                    redirect('/basket')
            else:
                redirect('/basket')

    @expose()
    def comment(self, **kwargs):
        text = kwargs.get('text')
        product_id = kwargs.get('product_id')
        product_title = kwargs.get('product_title')
        c = Comment(text=text, product_id=product_id, user_id=User.current().user_id)
        DBSession.add(c)
        DBSession.flush()
        redirect('/p/{}/{}'.format(product_id, product_title))

    @expose()
    def log_out(self):
        session.delete()
        redirect('/logout_handler')

    @expose()
    def post_login(self, came_from=lurl('/')):
        if not request.identity:
            return 'False'
        user = DBSession.query(User).filter(User.user_name == request.remote_user).one_or_none()
        session['user_id'] = user.user_id
        session['user_name'] = user.user_name
        session['display_name'] = user.display_name
        session.save()
        return 'True'

    @expose()
    def post_logout(self, came_from=lurl('/')):
        return HTTPFound(location=came_from)

    @expose('json')
    def register(self, **kwargs):
        username = kwargs.get('username')
        password = kwargs.get('password')
        DBSession.add(User(
            user_name=username,
            password=password
        ))
        try:
            DBSession.flush()
            return dict(ok=True)
        except IntegrityError:
            return dict(ok=False)
