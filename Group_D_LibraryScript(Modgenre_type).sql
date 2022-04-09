show databases;

create database if not exists group_d_library;

use group_d_library;

create table address (
			id smallint primary key auto_increment,
        first_line varchar(100) not null,
        second_line varchar(100),
        town varchar(35) not null,
        postcode varchar(8) not null,
        phone varchar(11),
        email varchar(100));
        
create table personal_details (
			id smallint primary key auto_increment,
        dob date not null,
        user_cat enum("staff", "child", "adult") not null,
        gender varchar(35));
        
create table library_members (
			id smallint primary key auto_increment,
        first_name varchar(35) not null,
        last_name varchar(35) not null,
        address smallint not null,
        personal_details smallint not null,
        foreign key (address) references address(id),
		foreign key (personal_details) references personal_details(id));
        
create table genre_type (
			id tinyint primary key auto_increment,
        genre varchar(35) not null);   
        
create table books (
			id smallint primary key auto_increment,
        book_title varchar(200) not null,
        author varchar(200) not null,
		genre tinyint not null,
        form enum("Fiction", "Non-Fiction") not null,
        class enum("Paper", "Electronic"),
        check_out_status enum("In", "Out") DEFAULT "In",
        release_date date,
        foreign key (genre) references genre_type(id));
        
        
create table loans (
			id smallint primary key auto_increment,
        person_id smallint not null,
        book_id smallint not null,
        loan_date date,
        return_date date,
        loan_status enum("returned", "not-returned"),
        foreign key (person_id) references library_members(id),
        foreign key (book_id) references books(id));
        
INSERT into ADDRESS VALUES (1, "10 Burley Road", "Burley", "Leeds", "LS7 3WR", "01131234567", "John@email.com");

insert into address(first_line, second_line, town, postcode, phone, email) values ('Second Street', 'The Alley', 'Middlesbrough', 'TS5 7LR', '07882300921', 'superfoxy@gmail.com');

insert into address values (9, "15 Kirkstall Street", "Kirkstall", "Leeds", "LS9 4FT", "01132345678", "Jane@email.com");

insert into address(first_line, second_line, town, postcode, phone, email) values ("70 Haugh Road", "Wath", "Rotherham", "S63 4XY", "017868904", "johnny@email.com");

insert into address values ( 5, "244 Burley Road", "Burley",  "Leeds", "LS4 2NZ", "01423330330", "Mabel@internet.com");


select * from address;


insert into personal_details (dob, user_cat, gender) values ("2002-03-27", "adult", "Male");

insert into personal_details (dob, user_cat, gender) values ("2016-05-22", "child", "female");

insert into personal_details (dob, user_cat, gender) values ("2013-10-12", "child", "Female"),
("1994-1-14", "adult", "male");

Insert into personal_details values (7, "1985-05-16", 2, "female");

insert into personal_details (dob, user_cat, gender) values ("2000-01-25", "adult", "male"), ("1983-03-20", "staff", "female"), ("2015-06-05", "child", "male");


select * from personal_details;

Insert into library_members (first_name, last_name, address, personal_details) values ("Mabel", "McTable", 10, 2);

insert into library_members (first_name, last_name, address, personal_details) values ("John", "Smith", 9, 9), ("Jane", "Green", 10, 10);

insert into library_members (first_name, last_name, address, personal_details) values ("Vanessa", "LePenguin", 5, 1);

insert into library_members (first_name, last_name, address, personal_details) values ("Jim", "Smith", 5, 3), ("Holly", "Buck", 2, 7);

select * from library_members;

insert into genre_type (genre) values ("fantasy"), ("sci-fi"), ("travel");

insert into genre_type (genre) values ("Romance"), ("Biography"), ("Poetry");

insert into genre_type (genre) values ("thriller"),("adventure"),("horror");

Insert into genre_type (genre) values ("Historical Fiction"), ("Crime"), ("Cookery");

insert into genre_type (genre) values ("travel"),("self-help"),("young adult");

select * from genre_type;

insert into books (book_title, author, form, class, release_date, genre) values ("War and Peace", "Leo Tolstoy", "fiction", "electronic", "1870-03-03", 10);

Insert into books (book_title, author, form, class, release_date, check_out_status, genre) values ("More Great Curries", "Meera Sodha", "non-fiction", "electronic", "2018-12-13", "out", 12);

insert into books (book_title, author, form, class, release_date, genre) values ("The Street Lawyer", "John Grisham", "fiction", "paper", "2021-05-17",11);

insert into books (book_title, author, form, class, check_out_status, release_date, genre) values ("Harry Potter and the Philosopher's Stone", "JK Rowling", "fiction", "paper", "out", "2002-08-21", 8), ("Crime of the time", "Francis Brown", "fiction", "electronic", "in", "2018-06-27", 11), ("The fantastic new one ", "JP Cooldog", "fiction", "electronic", "in", "2022-03-27", 11);

insert into books(book_title, author, form, class, check_out_status, release_date, genre) values ("Romeo and Juliet", "William Shakespeare", "fiction", "paper", "out", "1600-09-30", 4), ("The Shining", "Stephen King", "fiction", "electronic", "in", "1970-08-01", 3);

Insert into books (book_title, author, form, class, release_date, check_out_status, genre) values ("Devices and Desires", "P D James", "fiction", "electronic", "2018-04-14", "out", 11);

select * from books;

insert into loans (person_id, book_id, loan_date, return_date, loan_status) values (1, 2, "2022-01-02", "2022-01-20", "returned");

Insert into loans (person_id, book_id, loan_date, return_date, loan_status) values (2, 9, "2020-06-07", "2020-06-28", "returned");

insert into loans (person_id, book_id, loan_date, return_date, loan_status) values (3, 4, "2022-02-13", "2022-02-28", "not-returned");

insert into loans(loan_date, return_date, loan_status, person_id, book_id) values ("2022-01-05", "2022-02-05", "returned", 3, 6), ("2021-11-03", "2021-12-03", "returned", 1, 1), ("2022-01-20", "2022-02-20", "not-returned", 4, 5), ("2019-07-08", "2019-08-08", "returned", 5, 5);

Insert into loans (person_id, book_id, loan_date, return_date, loan_status) values (4, 2, "2022-03-10", "2022-03-31", "not-returned");

insert into loans (person_id, book_id, loan_date, return_date, loan_status) values (6, 3, "2022-03-05", "2022-03-26", "not-returned");


select * from loans;

-- avid reader of crime novels:
select book_title as "Crime Novels" from books where genre = 11;

-- Librarian to see who has overdue books:
select first_name, last_name, return_date from library_members inner join loans on library_members.id= loans.person_id where loan_status = "not-returned";

-- hip happening library menber to see latest releases:
select book_title as "Title", author as "Author", release_date as "Release Date" from books order by release_date desc;

-- local council to find out who is using the library:
select dob, user_cat, gender from personal_details;
select * from personal_details where dob between "2015-01-01" and "2021-01-01";

-- tech enthusiast to borrow electronic books:
select book_title as "Title", author as "Author", release_date as "Release Date" from books where class = "electronic";

create user 'Library_Member'@'localhost' identified by 'password';

grant select on group_d_library.books to 'Library_Member'@'localhost';

grant select on group_d_library.genre_type to 'Library_Member'@'localhost';

create user 'Staff'@'localhost' identified by 'password';

grant select on group_d_library.* to 'Staff'@'localhost';

grant insert on group_d_library.* to 'Staff'@'localhost';

grant delete on group_d_library.* to 'Staff'@'localhost';

grant create on group_d_library.* to 'Staff'@'locatestinglhost';

create user 'Council'@'localhost' identified by 'password';

grant select on group_d_library.personal_details to 'Council'@'localhost';


