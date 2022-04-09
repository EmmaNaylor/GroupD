from application import db
from dataclasses import dataclass

# the annotation below will help to turn the Python object into a JSON object
@dataclass
class Info(db.Model):
    # the declarations below are important for turning the object into JSON
    id: int
    dob: str
    user_cat: str
    gender: str

    id = db.Column(db.Integer, primary_key=True)
    dob = db.Column(db.String(12), nullable=False)
    user_cat = db.Column(db.String(10), nullable=False)
    gender = db.Column(db.String(35), nullable=True)
