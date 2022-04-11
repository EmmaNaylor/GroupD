from application import db
from dataclasses import dataclass

# the annotation below will help to turn the Python object into a JSON object


@dataclass
class Cat(db.Model):
    # the declarations below are important for turning the object into JSON
    id: int
    genre: str

    id = db.Column(db.Integer, primary_key=True)
    # big table (with fk) backrefs mini table name
    genre = db.relationship("Book", backref="cat")