from datetime import datetime

from sqlalchemy import Unicode, Integer, Column, DateTime

from onlinelux.model import DeclarativeBase


class Article(DeclarativeBase):
    __tablename__ = 'article'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode, nullable=False)
    description = Column(Unicode, nullable=False)
    image = Column(Unicode(25), nullable=False, unique=True)
    created = Column(DateTime, default=datetime.now)

