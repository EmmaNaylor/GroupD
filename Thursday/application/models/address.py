from application import db
from dataclasses import dataclass

# the annotation below will help to turn the Python object into a JSON object
@dataclass
class Address(db.Model):
    # the declarations below are important for turning the object into JSON
    id: int
    first_line: str
    second_line: str
    town: str
    postcode: str
    email: str

    id = db.Column(db.Integer, primary_key=True)
    first_line = db.Column(db.String(100), nullable=True)
    second_line = db.Column(db.String(100), nullable=False)
    town = db.Column(db.String(35), nullable=True)
    postcode = db.Column(db.String(8), nullable=True)
    phone = db.Column(db.String(11), nullable=False)
    email = db.Column(db.String(100), nullable=False)
