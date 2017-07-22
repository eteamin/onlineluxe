# -*- coding: utf-8 -*-
"""Template Helpers used in onlinelux."""
import logging
from markupsafe import Markup
from datetime import datetime

from sqlalchemy.orm import joinedload
from tg import session, config
from khayyam import JalaliDate

from onlinelux.model import DBSession, Picture, Category

log = logging.getLogger(__name__)


def current_year():
    now = datetime.now()
    return now.strftime('%Y')


def icon(icon_name):
    return Markup('<i class="glyphicon glyphicon-%s"></i>' % icon_name)


try:
    from webhelpers2 import date, html, number, misc, text
except SyntaxError:
    log.error("WebHelpers2 helpers not available with this Python Version")


def add_global_template_variables():
    return dict(
        today=JalaliDate.today().strftime('%A %d %B %Y'),
        time=datetime.now().strftime('%H:%M:%S'),
        session=session,
        base_url=config.get('base_url'),
        bottom_banners=DBSession.query(Picture).filter(Picture.genre == 'Bottom-Banners').all(),
        categories=DBSession.query(Category).options(joinedload('subcategory')).all()
        )
