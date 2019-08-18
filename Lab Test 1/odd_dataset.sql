drop table if exists Registration;
drop table if exists Course;
drop table if exists Student;
drop table if exists Department;
drop table if exists Hall;

create table Department(dept_cd char(2) PRIMARY KEY,dept_name varchar(30) not null,hod_name varchar(30) not null, year_of_establishment int);

create table Hall(hall_cd char(2) PRIMARY KEY not null,hall_name varchar(30) not null,no_of_rooms int not null);

create table Student(roll_no int PRIMARY KEY, student_name varchar(30) not null, year_of_admission int,dept_cd char(2),cgpa decimal(5,2),percentage_marks decimal(5,2),hall_cd char(2),FOREIGN KEY fk_dp(dept_cd) REFERENCES Department(dept_cd));

create table Course(course_cd char(5) PRIMARY KEY,course_name varchar(30) not null,credits int not null,max_marks decimal(5,2) not null,dept_cd char(2),FOREIGN KEY fk_dp(dept_cd) REFERENCES Department(dept_cd));

create table Registration(roll_no int,course_cd char(5),grade_point int,marks_obtained decimal(5,2),PRIMARY KEY(roll_no,course_cd),FOREIGN KEY fk_st(roll_no) REFERENCES Student(roll_no), FOREIGN KEY fk_cr(course_cd) REFERENCES Course(course_cd));

insert into Department values('CS','Computer Science','Sudheeshana',1989);
insert into Department values('EC','Electronics','Samrat',1994);
insert into Department values('MA','Mathematics','Rama',1991);
insert into Department values('ME','Mechanical Engineering','Mahatma',1994);

insert into Hall values ('EF','EFG',12);
insert into Hall values ('XY','XYZ',12);
insert into Hall values ('UV','UVW',0); 
insert into Hall values ('PR','PRS',15);

insert into Student values (10000,'Aditya',2013,'CS',9.36,89.00,'AB');
insert into Student values (10001,'Adam',2012,'CS',8.83,87.00,'AB');
insert into Student values (10002,'Anil',2012,'CS',8.40,81.67,'AB');
insert into Student values (10003,'Anoop',2014,'CS',7.38,69.50,'AB');
insert into Student values (10004,'Aravind',2016,'EC',8.57,81.00,'AB');
insert into Student values (10005,'Bunny',2014,'CS',9.14,87.67,'AB');
insert into Student values (10006,'Bhanu',2014,'CS',7.29,65.00,'AB');
insert into Student values (10007,'Cummins',2014,'MA',7.21,65.00,'AB');
insert into Student values (10008,'Saptarshi',2014,'EC',7.29,67.84,'EF');
insert into Student values (10009,'Sabarish',2014,'MA',8.17,76.88,'AB');
insert into Student values(10010, 'Shabharesh', 2015, 'CS', NULL, NULL,NULL);
insert into Student values (10011,'Jaishree',2014,'MA',8.50,82.73,'AB');
insert into Student values (10012,'Jai',2013,'CS',8.00,74.40,'AB');
insert into Student values (10013,'Debopriyo',2014,'EC',NULL,NULL,'EF');

insert into Course values ('CS100','PDS',4,100.00,'CS');
insert into Course values ('CS101','DBMS',3,60.00,'CS');
insert into Course values ('CS102','DBMSLab',2,40.00,'CS');
insert into Course values ('CS103','OS',3,60.00,'CS');
insert into Course values ('CS104','OSLab',2,40.00,'CS');
insert into Course values ('CS105','CN','3',50.00,'CS' );
insert into Course values ('CS106','CNLab',2,50.00,'CS');
insert into Course values ('CS107','Information Retrieval',3,100.00,'CS');
insert into Course values ('CS108','Deep Learning',2,70.00,'CS'   );
insert into Course values ('CS109','Seminar',2,50.00,'CS');
insert into Course values ('EC000','MicroElectronics',2,40.00,'EC' );
insert into Course values ('EC001','DLD',3,80.00,'EC');
insert into Course values ('MA000','AdvancedMaths',3,80.00,'MA');

insert into Registration values(10000,'CS100',9,86.00);
insert into Registration values(10000,'CS102',9,34.00);
insert into Registration values(10000,'CS103',9,52.00);
insert into Registration values(10000,'CS104',10,40.00);
insert into Registration values(10001,'CS103',8,48.00);
insert into Registration values(10001,'CS104',8,30.00);
insert into Registration values(10001,'CS108',9,61.00);
insert into Registration values(10001,'CS109',9,42.00);
insert into Registration values(10001,'MA000',10,80.00);
insert into Registration values(10002,'EC000',9,34.00);
insert into Registration values(10002,'EC001',8,64.00);
insert into Registration values(10003,'CS105',7,30.00);
insert into Registration values(10003,'CS106',7,33.00);
insert into Registration values(10003,'CS107',8,76.00);
insert into Registration values(10004,'CS100',10,93.00);
insert into Registration values(10004,'CS101',9,50.00);
insert into Registration values(10004,'CS102',8,30.00);
insert into Registration values(10004,'CS103',7,40.00);
insert into Registration values(10004,'CS104',8,30.00);
insert into Registration values(10005,'CS100',10,92.00);
insert into Registration values(10005,'CS101',10,56.00);
insert into Registration values(10005,'CS102',8,31.00);
insert into Registration values(10005,'CS103',8,49.00);
insert into Registration values(10005,'CS104',9,35.00);
insert into Registration values(10006,'CS100',6,47.00);
insert into Registration values(10006,'CS101',9,52.00);
insert into Registration values(10006,'CS102',7,25.00);
insert into Registration values(10006,'CS103',7,41.00);
insert into Registration values(10006,'CS104',8,30.00);
insert into Registration values(10007,'CS100',6,47.00);
insert into Registration values(10007,'CS103',7,41.00);
insert into Registration values(10007,'CS104',8,30.00);
insert into Registration values(10007,'EC000',8,31.00);
insert into Registration values(10007,'EC001',8,59.00);
insert into Registration values(10008,'CS100',6,47.00);
insert into Registration values(10008,'CS103',7,41.00);
insert into Registration values(10008,'CS104',8,30.00);
insert into Registration values(10008,'CS107',9,86.00);
insert into Registration values(10008,'CS108',7,47.00);
insert into Registration values(10009,'CS101',9,52.00);
insert into Registration values(10009,'CS102',7,25.00);
insert into Registration values(10009,'CS107',9,86.00);
insert into Registration values(10009,'CS108',7,47.00);
insert into Registration values(10009,'CS109',8,36.00);
insert into Registration values(10011,'CS105',9,44.00);
insert into Registration values(10011,'CS106',9,42.00);
insert into Registration values(10011,'EC000',8,31.00);
insert into Registration values(10011,'EC001',8,65.00);
insert into Registration values(10012,'CS109',8,36.00);
insert into Registration values(10012,'EC000',8,31.00);
insert into Registration values(10012,'EC001',8,59.00);
insert into Registration values(10012,'MA000',8,60.00);
