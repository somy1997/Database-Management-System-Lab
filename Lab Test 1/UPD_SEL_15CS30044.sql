/*
Roll No:	15CS30044
Name:		Nishant Baranwal Somy
PC Number:	25
*/

1.

UPDATE Student S
SET percentage_marks = 
(
SELECT SUM(marks_obtained*100*credits/max_marks)/SUM(credits)
FROM Course natural join Registration R
WHERE R.roll_no = S.roll_no
);

2.

INSERT INTO Hall VALUES
('AB','ABC',
(
SELECT COUNT(*)
FROM Student NATURAL JOIN Department
WHERE dept_name like '_A___%'
)
);

3.

DELETE FROM Hall
WHERE no_of_rooms <
(
SELECT COUNT(*)
FROM Student
WHERE hall_cd IS NULL
);

4.

SELECT roll_no,student_name
FROM Student
WHERE cgpa = 
(
SELECT MAX(cgpa) FROM Student
);

5.

SELECT roll_no,student_name
FROM Student S
WHERE dept_cd = 'CS'
AND 'CS' NOT IN
(
SELECT DISTINCT dept_cd
FROM Course NATURAL JOIN Registration R
WHERE R.roll_no = S.roll_no
);

6.

SELECT dept_cd,dept_name
FROM Department D
WHERE year_of_establishment < 1990
AND
(
SELECT COUNT(*)
FROM Course C
WHERE C.dept_cd = D.dept_cd
) > 5
;

7.

SELECT course_cd,course_name
FROM Course C
WHERE
(
SELECT COUNT(*)
FROM Registration R
WHERE R.course_cd = C.course_cd
)
>
(
SELECT AVG(no_of_students)
FROM 
(
SELECT COUNT(*) AS no_of_students, R1.course_cd AS course
FROM Registration R1
GROUP BY R1.course_cd
)
AS Other_Courses
WHERE course <> C.course_cd
)
;

SELECT AVG(nstuds) yo
FROM
(
SELECT COUNT(*) "nstuds"
FROM Registration R1
GROUP BY R1.course_cd
) course
;

8.

CREATE VIEW DistinctCgpa AS
SELECT DISTINCT cgpa
FROM Student S;

CREATE VIEW 6thLargest AS
SELECT MAX(D1.cgpa)
FROM DistinctCgpa D1,DistinctCgpa D2,DistinctCgpa D3,DistinctCgpa D4,DistinctCgpa D5,DistinctCgpa D6
WHERE D1.cgpa<D2.cgpa
AND D2.cgpa<D3.cgpa
AND D3.cgpa<D4.cgpa
AND D4.cgpa<D5.cgpa
AND D5.cgpa<D6.cgpa;

SELECT roll_no,student_name
FROM Student S
WHERE S.cgpa IN
(
SELECT *
FROM 6thLargest
);

OR

SELECT roll_no,student_name
FROM Student S
WHERE
(
SELECT COUNT(DISTINCT cgpa)
FROM Student S2
WHERE S2.cgpa > S.cgpa
) = 5;

9.

SELECT roll_no,student_name,hall_name
FROM Student LEFT OUTER JOIN Hall USING (hall_cd);

10.

SELECT roll_no,student_name
FROM Student S
WHERE year_of_admission < 2013
AND NOT EXISTS
(
SELECT * 
FROM Registration R
WHERE R.roll_no = S.roll_no
);
