/*
Roll No:	15CS30044
Name:		Nishant Baranwal Somy
PC Number:	25
*/

CREATE TABLE Student
(
roll_no int PRIMARY KEY,
student_name  varchar(30)  not  null,
year_of_admission  int,
dept_cd  char(2)  not null,
cgpa decimal(5,2),
percentage_marks decimal(5,2),
hall_cd char(2)
);

CREATE TABLE Course
(
course_cd char(5) PRIMARY KEY,
course_name  varchar(30) not null,
credits   int   not   null,
max_marks  decimal(5,2) not null, 
dept_cd char(2) not null
);

CREATE TABLE Registration
(  
roll_no int PRIMARY KEY, 
course_cd char(5), 
grade_point int,
marks_obtained decimal(5,2)
);

--1

CREATE VIEW totalcredits(roll,tcr) AS
SELECT roll_no,SUM(credits)
FROM Registration R, Course C
WHERE R.course_cd = C.course_cd
GROUP BY roll_no;

create trigger update_cgpa1 before insert of Registration
referencing new row as nrow
referencing old row as orow
FOR EACH ROW
begin atomic
when (grade_point IS NOT NULL)
	UPDATE Student,totalcredits,Course
	SET cgpa = (cgpa*tcr+nrow.grade_point*Course.credits)/(tcr+Course.credits)
	WHERE Student.roll_no = totalcredits.roll AND nrow.course_cd = Course.course_cd;
END;

create trigger update_cgpa2 before update of Registration
referencing new row as nrow
referencing old row as orow
for each row
when nrow.grade is not null
    and (orow.grade is null)
begin atomic
     UPDATE Student,totalcredits,Course
	 SET cgpa = (cgpa*tcr+(nrow.grade_point-orow.grade_point)*Course.credits)/(tcr)
	 WHERE Student.roll_no = totalcredits.roll AND nrow.course_cd = Course.course_cd;
end;

create trigger update_cgpa3 before delete of Registration
referencing old row as orow
for each row
when nrow.grade is not null
    and (orow.grade is null)
begin atomic
     UPDATE Student,totalcredits,Course
	 SET cgpa = (cgpa*tcr-(orow.grade_point)*Course.credits)/(tcr-Course.credits)
	 WHERE Student.roll_no = totalcredits.roll AND nrow.course_cd = Course.course_cd;
end;

--2.

create procedure dept_count_proc (in roll int,out cgpa decimal(5,2))
begin
	   update Student 
	   set cgpa = 
	   (
	   	       select sum(R.grade_point*C.credits)/sum(C.credits)
	   	       from Course C, Registration R
	   	       where C.course_cd = R.course_cd
	   	       and R.roll_no = roll
	   )
	   where rollno = roll
	   select cgpa into d_count
       from Student
       where roll_no = roll
end

--3.

with recursive emp_manager(emp_cd, manager_emp_cd) as (
        select emp_cd, manager_emp_cd
        from Employee
    union
        select emp_manager.emp_cd, Employee.manager_emp_cd, 
        from emp_manager, Employee
        where emp_manager.manager_emp_cd = Employee.emp_cd
    )
select ∗
from emp_manager
where emp_cd = 5;
