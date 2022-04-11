from application import db
from dataclasses import dataclass

# the annotation below will help to turn the Python object into a JSON object


@dataclass
class Loan(db.Model):
    # the declarations below are important for turning the object into JSON
    id: int
    person_id: int
    book_id: int
    loan_date: str
    return_date: str
    loan_status: str

    id = db.Column(db.Integer, primary_key=True)
    loan_date = db.Column(db.String(12), nullable=True)
    return_date = db.Column(db.String(12), nullable=True)
    loan_status = db.Column(db.String(15), nullable=True)
    person_id = db.Column(db.Integer, db.ForeignKey("member.id"), nullable=False)
    book_id = db.Column(db.Integer, db.ForeignKey("book.id"), nullable=False)
