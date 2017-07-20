# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose, predicates, redirect

from onlinelux.model import DBSession, SubCategory, Product

from onlinelux.lib.base import BaseController
from onlinelux.lib.store import StorageManager

__all__ = ['RootController']


class Area51Controller(BaseController):
    allow_only = predicates.has_permission('manage')

    @expose('onlinelux.templates.admin')
    def index(self):
        subcategories = DBSession.query(SubCategory).all()
        return dict(subcategories=subcategories)

    @expose()
    def submit_product(self, **kw):
        images = ','.join([StorageManager().store(i) for i in kw.get('form-images')])
        del kw['form-images']
        p = Product()
        p.images = images
        for k, v in kw.items():
            p.__setattr__(k, v)
        DBSession.add(p)
        DBSession.flush()
        redirect('/area51')

