from application import db

# from application.models.address import Address
# from application.models.cat import Cat
from application.models.book import Book
from application.models.info import Info
# from application.models.loan import Loan
# from application.models.member import Member


from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/group_d_library', echo=False)
Session = sessionmaker(bind=engine)
session = Session()

# team = Teams(affiliation='X-men', objective='Being eXXXtra cool')
# session.add(team)
# session.commit()

# hero = Heroes(name='Clinton Barton', alias='Hawkeye', superPower='Master Archer', teamID=4)
# session.add(hero)
# session.commit()


info = session.query(Info).filter_by(id=1).first()
print(info.dob, info.user_cat, info.gender)



