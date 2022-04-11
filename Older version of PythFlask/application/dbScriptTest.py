from application import db

# from application.models.address import Address
# from application.models.book import Books
# from application.models.cat import Cat
from application.models.info import Info
# from application.models.loan import Loan
# # from application.models.member import Member


from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('mysql+pymysql://root:password@localhost/group_d_library', echo=True)
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

#
# hero = session.query(Heroes).filter_by(alias='Iron Man').first()
# print(hero.name, hero.superPower, hero.alias, hero.teamID)
#
# team = session.query(Teams).filter_by(id=4).first()
# print(team.affiliation, team.objective)
# for hero in team.heroes:
#     print(hero.name, '=', hero.alias)
