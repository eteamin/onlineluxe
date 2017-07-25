from datetime import datetime
import json
import string
import random

from sqlalchemy import Unicode, Integer, Column, DateTime, ForeignKey, Table, Enum, Boolean
from sqlalchemy.orm import relationship, backref, synonym

from onlinelux.model import DeclarativeBase, User


class Category(DeclarativeBase):
    __tablename__ = 'category'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode(50), unique=True, nullable=False)
    subcategory = relationship('SubCategory', backref=backref('category'), cascade="all, delete-orphan")


class SubCategory(DeclarativeBase):
    __tablename__ = 'subcategory'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode(50), unique=True, nullable=False)

    cat_id = Column(Integer, ForeignKey('category.id'), index=True)
    products = relationship('Product', backref=backref('subcategory'), cascade="all, delete-orphan")


class Comment(DeclarativeBase):
    __tablename__ = 'comment'

    id = Column(Integer, primary_key=True)
    created = Column(DateTime, default=datetime.now)
    text = Column(Unicode, nullable=False)
    accepted = Column(Boolean)
    product_id = Column(Integer, ForeignKey('product.id'), index=True)
    user_id = Column(Integer, ForeignKey('tg_user.user_id'), index=True)


product_purchase_table = Table(
    'product_purchase', DeclarativeBase.metadata,
    Column('purchase_id', Integer, ForeignKey('purchase.id', onupdate="CASCADE", ondelete="CASCADE"), primary_key=True),
    Column('product_id', Integer, ForeignKey('product.id', onupdate="CASCADE", ondelete="CASCADE"), primary_key=True)
)


class Product(DeclarativeBase):
    __tablename__ = 'product'

    id = Column(Integer, primary_key=True)
    name = Column(Unicode(55), unique=True, nullable=False)
    description = Column(Unicode, nullable=False)
    size = Column(Integer, nullable=True)
    quality = Column(Unicode, nullable=False)
    quantity = Column(Integer, nullable=False)
    images = Column(Unicode, unique=True, nullable=False)  # comma-sep image_path specified by StorageManager
    price = Column(Integer, nullable=False)
    created = Column(DateTime, default=datetime.now)
    comments = relationship('Comment', backref=backref('product'), cascade="all, delete-orphan")

    subcat_id = Column(Integer, ForeignKey('subcategory.id'), index=True)

    purchase = relationship(
        "Purchase",
        secondary=product_purchase_table,
        back_populates="product")


class Purchase(DeclarativeBase):
    __tablename__ = 'purchase'

    id = Column(Integer, primary_key=True)
    uid = Column(Unicode(10), unique=True)
    user_id = Column(Integer, ForeignKey('tg_user.user_id'), index=True)
    created = Column(DateTime, default=datetime.now)
    status = Column(Enum('Selection', 'Payment', 'Preparing', 'Sent', 'Delivered', name='order_status'), default='Selection')
    authority = Column(Unicode, nullable=True)
    ref_id = Column(Unicode, nullable=True)

    product = relationship(
        "Product",
        secondary=product_purchase_table,
        back_populates="purchase")

    _items = Column('items', Unicode, default='')

    def _set_items(self, data):
        self._items = json.dumps(data)

    def _get_items(self):
        return json.loads(self._items)

    items = synonym('_items', descriptor=property(_get_items, _set_items))

    def set_uid(self, size=6, chars=string.ascii_lowercase + string.digits):
        uid = ''.join(random.choice(chars) for _ in range(size))
        self.uid = 'pdt-{}'.format(uid)
