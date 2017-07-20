# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, flash, require, url, lurl
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
from onlinelux.controllers.error import ErrorController

__all__ = ['RootController']


class RootController(BaseController):
    secc = SecureController()
    admin = AdminController(model, DBSession, config_type=TGAdminConfig)

    error = ErrorController()

    def _before(self, *args, **kw):
        tmpl_context.project_name = "onlinelux"

    @expose('onlinelux.templates.index')
    def index(self):
        latest = DBSession.query(Product).order_by(Product.id.desc()).limit(16).all()
        articles = DBSession.query(Article).order_by(Article.id.desc()).limit(2).all()
        carousels = DBSession.query(Picture).filter(Picture.genre == 'Carousel').all()
        top = []
        return dict(latest=latest, articles=articles, carousels=carousels, top=[])

    @expose('onlinelux.templates.login')
    def login(self, came_from=lurl('/'), failure=None, login=''):
        return dict()

    @expose()
    def post_login(self, came_from=lurl('/')):
        if not request.identity:
            return 'False'
        return 'True'

    @expose()
    def post_logout(self, came_from=lurl('/')):
        return HTTPFound(location=came_from)
