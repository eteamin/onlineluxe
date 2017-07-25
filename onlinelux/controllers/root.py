# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, flash, require, url, lurl, session, abort
from tg import request, redirect, tmpl_context
from tg.i18n import ugettext as _, lazy_ugettext as l_
from tg.exceptions import HTTPFound
from tg import predicates
from tgext.admin.tgadminconfig import BootstrapTGAdminConfig as TGAdminConfig
from tgext.admin.controller import AdminController
from sqlalchemy.orm import joinedload
from sqlalchemy.exc import IntegrityError

from onlinelux import model
from onlinelux.controllers.secure import SecureController
from onlinelux.model import DBSession, Article, Product, Purchase, User, Comment
from onlinelux.lib.base import BaseController
from onlinelux.controllers.error import ErrorController
from onlinelux.controllers.admin import Area51Controller

__all__ = ['RootController']


class RootController(BaseController):
    secc = SecureController()
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
        return dict(latest=latest, articles=articles, top=top)

    @expose('onlinelux.templates.product')
    def p(self, id, title):
        product = DBSession.query(Product).options(joinedload('comments.tg_user')).filter(Product.id == id).one_or_none()
        if not product:
            abort(404)

        return dict(product=product)

    @expose('onlinelux.templates.subcategory')
    def s(self, id, title, **kwargs):
        # TODO: Pagination
        products = DBSession.query(Product).filter(Product.subcat_id == id).all()
        return dict(products=products)

    @expose('onlinelux.templates.basket')
    def basket(self):
        basket = DBSession.\
            query(Purchase).\
            filter(Purchase.user_id == User.current().user_id).\
            order_by(Purchase.id.desc()).\
            first()
        basket = basket if basket and basket.status == 'Selection' else None
        return dict(basket=basket)

    @expose()
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
                pass
            elif product not in basket.product:
                basket.product.append(product)
                tmp = basket.items
                tmp[product.id] = 1
                basket.items = tmp
                DBSession.flush()
            redirect('/basket')
        if not basket or basket.status != 'Selection':
            basket = Purchase(
                user_id=user.user_id,
                items={}
            )
            basket.product.append(product)
            tmp = basket.items
            tmp[product.id] = 1
            basket.items = tmp
            DBSession.add(basket)
            DBSession.flush()
            redirect('/basket')

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
    def post_login(self, came_from=lurl('/')):
        if not request.identity:
            return 'False'
        user = DBSession.query(User).filter(User.user_name == request.remote_user).one_or_none()
        session['user_id'] = user.user_id
        session['user_name'] = user.user_name
        session['display_name'] = user.display_name
        session.save()
        return 'True'

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
        return dict(user=user, basket_id=basket_id)

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
        try:
            DBSession.flush()
        except IntegrityError:
            return dict(ok=False)
        


    @expose()
    def post_logout(self, came_from=lurl('/')):
        return HTTPFound(location=came_from)
