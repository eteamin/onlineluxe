from datetime import datetime

from sqlalchemy import Unicode, Integer, Column, DateTime, ForeignKey
from sqlalchemy.orm import relationship, backref

from onlinelux.model import DeclarativeBase


class Article(DeclarativeBase):
    __tablename__ = 'article'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode, nullable=False)
    description = Column(Unicode, nullable=False)
    image = Column(Unicode(25), nullable=False, unique=True)
    views = Column(Integer, default=0)
    created = Column(DateTime, default=datetime.now)

    topic_id = Column(Integer, ForeignKey('topic.id'), index=True)


class Topic(DeclarativeBase):
    __tablename__ = 'topic'

    id = Column(Integer, primary_key=True)
    title = Column(Unicode(25), nullable=False)

    articles = relationship('Article', backref=backref('topic'), cascade="all, delete-orphan")
