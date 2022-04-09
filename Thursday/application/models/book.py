from application import db
from dataclasses import dataclass

# the annotation below will help to trun the Python object into a JSON object
@dataclass
class Books(db.Model):
    # the declarations below are important for turning the object into JSON
    id: int
    book_title: str
    author: str
    genre_id: str
    form: str
    material: str
    check_out_status: str
    release_date: str


    id = db.Column(db.Integer, primary_key=True)
    book_title = db.Column(db.String(100), nullable=False)
    author = db.Column(db.String(70), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey('cat.id'), nullable=False)
    form = db.Column(db.String(20), nullable=False)
    material = db.Column(db.String(70), nullable=True)
    check_out_status = db.Column(db.String(70), nullable=True)
    release_date = db.Column(db.String(70), nullable=True)
