from application import db
from application.models.address import Address
from application.models.cat import Cat
from application.models.book import Book
from application.models.info import Info
from application.models.loan import Loan
# from application.models.member import Member


def display_book():
    return Book.query.all()


def display_books():
    # books = db.session.query(Book)
    return Book.query.all()


def get_all_addresses():
    return Address.query.all()


def get_book_by_id(book_id):
    if book_id > 0:
        return Book.query.get(book_id)
    else:
        return None


def get_book_by_genre(genre_id):
    return Book.query.filter_by(genre=genre_id).first()

