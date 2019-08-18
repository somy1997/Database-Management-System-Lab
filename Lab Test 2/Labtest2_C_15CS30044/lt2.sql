CREATE TABLE Offering ( dept_cd CHAR(10), course_cd CHAR(10), semester CHAR(1), FOREIGN KEY (dept_cd) REFERENCES Department(dept_cd), FOREIGN KEY (course_cd) REFERENCES Course(course_cd) );

SELECT course_cd, course_name, no_of_credits, semester
FROM Offering NATURAL JOIN Course
WHERE dept_cd = 'xyz';
