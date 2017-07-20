from sqlalchemy import Unicode, Integer, Column, Enum

from onlinelux.model import DeclarativeBase


class Picture(DeclarativeBase):
    __tablename__ = 'picture'

    id = Column(Integer, primary_key=True)
    genre = Column(
        Enum(
            'Carousel',
            'Banner',
            'Top',
            'Special',
            'Bottom-Banners',
            name='picture_genres'
        ),
        nullable=False
    )
    image = Column(Unicode(25), nullable=False, unique=True)
    href = Column(Unicode, nullable=False)
