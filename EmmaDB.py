from sqlalchemy import create_engine
from sqlalchemy import text

member = create_engine("mysql+pymysql://Library_Member:password@localhost/group_d_library", echo=False, future=True)

# Library member wants to see all crime novels
print("ALL CRIME NOVELS")
with member.connect() as conn:
    result = conn.execute(text("SELECT book_title from books where genre = 11"))
    for row in result:
        print(f"{row.book_title}")
print("***************************************************************************************************************************")

# Hip-Happening Library members wants to see the latest releases
print("LATEST RELEASES")
with member.connect() as conn:
    result = conn.execute(text("SELECT book_title, author, release_date, class from books where release_date >='2021-00-01' order by release_date desc"))
    for row in result:
        print(f"{row.book_title}by {row.author} released: {row.release_date}")

print("***************************************************************************************************************************")

# Tech Enthusiast wants to borrow some electronic books
print("ELECTRONIC BOOKS")
with member.connect() as conn:
    result = conn.execute(text("select book_title, author, release_date from books where class = 'electronic'"))
    for row in result:
        print(f"{row.book_title}by {row.author} released: {row.release_date}")

print("***************************************************************************************************************************")

staff = create_engine("mysql+pymysql://Staff:password@localhost/group_d_library", echo=False, future=True)

# Librarian to see who has overdue books
print("MEMBERS WITH OVERDUE LIBRARY BOOKS")
with staff.connect() as conn2:
    result = conn2.execute(
        text("""select first_name, last_name, return_date from library_members inner join loans
         on library_members.id= loans.person_id where loan_status = 'not-returned'"""))
    for row in result:
        print(f"First Name: {row.first_name}  Last Name: {row.last_name} Return Date: {row.return_date}")
print("***************************************************************************************************************************")

council = create_engine("mysql+pymysql://Council:password@localhost/group_d_library", echo=False, future=True)

# Council to see demographic info
print("COUNCIL VIEWING DEMOGRAPHIC INFO")
with council.connect() as conn3:
    result = conn3.execute(
        text("""select * from personal_details"""))
    for row in result:
        print(f"{row.dob} {row.user_cat} {row.gender}")
print("***************************************************************************************************************************")

# Checking ability for staff to make a new table

# with staff.connect() as conn2:
#     conn2.execute(text("CREATE TABLE testing (x int, y int)"))
#     conn2.execute(
#         text("INSERT INTO testing (x, y) VALUES (:x, :y)"),
#         [{"x": 1, "y": 1}, {"x": 2, "y": 4}]
#     )
#     conn2.commit()

# with staff.connect() as conn2:
#     result = conn2.execute(text("SELECT x, y FROM testing"))
#     for row in result:
#         print(f"x: {row.x}  y: {row.y}")



print('******parameterised query ********')

choice = (input("What genre of book would you like? "))
with member.connect() as conn:
    result = conn.execute(
        text("select book_title, author, genre_type.genre from genre_type inner join books on genre_type.id= books.genre where genre_type.genre like :param"),
        {"param": choice}
    )
    for row in result:
        print(f"{row.book_title} by {row.author}")

