/*
Roll No:	15CS30044
Name:		Nishant Baranwal Somy
PC Number:	25
*/

CREATE TABLE Book
(
book_id CHAR(6) PRIMARY KEY, 
book_name VARCHAR(50) NOT NULL, 
topic VARCHAR(30) NOT NULL
);

CREATE TABLE Author
(
author_id CHAR(6) PRIMARY KEY, 
author_name VARCHAR(50) NOT NULL, 
date_of_birth DATE NOT NULL
);

CREATE TABLE Book_Author
(
book_id CHAR(6) NOT NULL REFERENCES Book, 
author_id CHAR(6) NOT NULL REFERENCES Author,
PRIMARY KEY(book_id,author_id) 
);

CREATE TABLE Library_Member
(
member_id CHAR(6) PRIMARY KEY, 
member_name VARCHAR(50) NOT NULL
);

CREATE TABLE Member_Phone
(
member_id CHAR(6) NOT NULL REFERENCES Library_Member, 
phone_number CHAR(11) NOT NULL,
PRIMARY KEY(member_id,phone_number) 
);

CREATE TABLE Member_Degree
(
member_id CHAR(6) NOT NULL REFERENCES Library_Member, 
degree CHAR(11) NOT NULL,
PRIMARY KEY(member_id,degree) 
);

CREATE TABLE Edition
(
book_id CHAR(6) NOT NULL REFERENCES Book, 
edition_number INT NOT NULL,
year_of_publication INT NOT NULL,
price NUMERIC(7,2) NOT NULL,
member_id CHAR(6) REFERENCES Library_Member,
date_of_issue DATE,
due_date_of_submission DATE,
fine_paid NUMERIC(7,2),
PRIMARY KEY(book_id,edition_number) 
);


