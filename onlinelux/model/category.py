from datetime import datetime

from sqlalchemy import Unicode, Integer, Column, DateTime, ForeignKey, Table, Enum, Boolean

from onlinelux.model import DeclarativeBase


class Category(DeclarativeBase):
    __tablename__ = 'category'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode(50), unique=True, nullable=False)


class SubCategory(DeclarativeBase):
    __tablename__ = 'subcategory'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode(50), unique=True, nullable=False)

    cat_id = Column(Integer, ForeignKey('category.id'), index=True)


class Comment(DeclarativeBase):
    __tablename__ = 'comment'

    id = Column(Integer, primary_key=True)
    created = Column(DateTime, default=datetime.now)
    text = Column(Unicode, nullable=False)
    accepted = Column(Boolean)
    product_id = Column(Integer, ForeignKey('product.id'), index=True)
    user_id = Column(Integer, ForeignKey('tg_user.user_id'), index=True)


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

    subcat_id = Column(Integer, ForeignKey('subcategory.id'), index=True)


class Purchase(DeclarativeBase):
    __tablename__ = 'purchase'

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('tg_user.user_id'), index=True)
    created = Column(DateTime, default=datetime.now)
    status = Column(Enum('Preparing', 'Sent', 'Delivered', name='order_status'), default='Preparing')


product_purchase_table = Table(
    'product_purchase', DeclarativeBase.metadata,
    Column('purchase_id', Integer, ForeignKey('purchase.id', onupdate="CASCADE", ondelete="CASCADE"), primary_key=True),
    Column('product_id', Integer, ForeignKey('product.id', onupdate="CASCADE", ondelete="CASCADE"), primary_key=True)
)


