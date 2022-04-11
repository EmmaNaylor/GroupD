from application import db
from dataclasses import dataclass

# the annotation below will help to turn the Python object into a JSON object
@dataclass
class Member(db.Model):
    id: int
    first_name: str
    last_name: str
    address: int
    personal_details: int

    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(20), nullable=False)
    last_name = db.Column(db.String(30), nullable=False)
    address = db.Column(db.Integer, db.ForeignKey('address.id', nullable=False))
    personal_details = db.Column(db.Integer, db.ForeignKey('info.id', nullable=False))
