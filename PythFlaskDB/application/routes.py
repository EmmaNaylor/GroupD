import json

from flask import render_template, request, jsonify

import service
from application import app


@app.route('/', methods=['GET'])
@app.route('/home', methods=['GET'])
def hello():
    return render_template("home.html", title="Home")

@app.route('/books', methods=['GET'])
def show_books():
    error = ""
    details = service.display_books()
    if len(details) == 0:
        error = "There are no books to display"
    return render_template('book.html', books=details, message=error)


# Ayla's address search
@app.route('/home/address', methods=['GET'])
def show_addresses():
    error = ""
    address = service.get_all_addresses()
    if len(address) == 0:
        error = "There are no addresses to display"
    return render_template('address.html', address=address, message=error)


@app.route('/book/<int:book_id>', methods=['GET'])
def show_book(book_id):
    error = ""
    check_id = service.get_book_by_id(book_id)
    if not check_id:
        return jsonify("There are no books with ID: " + str(book_id))
    return jsonify(check_id)


@app.route('/booksbygenre/<int:genre_id>', methods=['GET'])
def book_genre(genre_id):
    error = ""
    kind = service.get_book_by_genre(genre_id)
    if not kind:
        error = "There is no book with genre: " + str(genre_id)
    return render_template('books_by_genre.html', genre=kind, message=error, title="Books by genre")
