# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, flash, require, url, lurl, session, abort
from tg import request, redirect, tmpl_context
from tg.i18n import ugettext as _, lazy_ugettext as l_
from tg.exceptions import HTTPFound
from tg import predicates
from onlinelux import model
from onlinelux.controllers.secure import SecureController
from onlinelux.model import DBSession, Article, Product, Picture
from tgext.admin.tgadminconfig import BootstrapTGAdminConfig as TGAdminConfig
from tgext.admin.controller import AdminController


from onlinelux.lib.base import BaseController
from onlinelux.model import User
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
        carousels = DBSession.query(Picture).filter(Picture.genre == 'Carousel').all()
        top = []
        return dict(latest=latest, articles=articles, carousels=carousels, top=top)

    @expose('onlinelux.templates.product')
    def p(self, id, title):
        product = DBSession.query(Product).filter(Product.id == id).one_or_none()
        if not product:
            abort(404)

        return dict(product=product)

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
