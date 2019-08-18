CREATE TABLE Student
(
roll_no int PRIMARY KEY, 
student_name VARCHAR(30) NOT NULL,
year_of_admission int,
dept_cd char(2) not null references Department,
cgpa decimal(5,2),
percentage_marks decimal(5,2),
hall_cd char(2) references Hall
);

CREATE TABLE Course
(
course_cd CHAR(5) PRIMARY KEY, 
course_name VARCHAR(30) NOT NULL,
credits int not null,
max_marks decimal(5,2) not null,
dept_cd char(2) not null references Department
);

CREATE TABLE Department
(
dept_cd CHAR(2) PRIMARY KEY, 
dept_name VARCHAR(30) NOT NULL,
hod_name varchar(30) not null,
year_of_establishment int
);

CREATE TABLE Hall
(
hall_cd CHAR(2) PRIMARY KEY, 
hall_name VARCHAR(30) NOT NULL,
no_of_rooms int not null
);

CREATE TABLE Registration
(
roll_no int references Student,
course_cd CHAR(5) references Course, 
grade_point int,
marks_obtained decimal(5,2),
primary key(roll_no,course_cd)
);



















