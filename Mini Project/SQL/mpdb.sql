--btw check constraints are not supported in mysql, we can use posgresql instead or some other dbms engines

CREATE TABLE inst
(
	iid		CHAR(9)			NOT NULL PRIMARY KEY,
	--similar to student ids
	pass	VARCHAR(30)		NOT NULL,
	name	VARCHAR(30)		NOT NULL
	--CHECK (LENGTH(pass) >= 8),
	--id REGEXP '^[:digit:]{2}[:alpha:]{2}[:digit:]{5}$'),
);

CREATE TABLE stud
(
	sid		CHAR(9)			NOT NULL PRIMARY KEY,
	pass	VARCHAR(30)		NOT NULL,
	name	VARCHAR(30)		NOT NULL
	--CHECK (LENGTH(pass) >= 8),
	--id REGEXP '^[:digit:]{2}[:alpha:]{2}[:digit:]{5}$'),
);

CREATE TABLE course
(
	cid		CHAR(7)			NOT NULL PRIMARY KEY,
	name	VARCHAR(30)		NOT NULL,
	--id REGEXP '^[:alpha:]{2}[:digit:]{5}$'),
);

CREATE TABLE ass
(
	ps		VARCHAR(1000)	NOT NULL,
	cid		CHAR(7)			NOT NULL,
	ano		INT				NOT NULL,
	subbyi	CHAR(9)			NOT NULL,
	duedt	TIMESTAMP		NOT NULL,
	maxmks	INT				NOT NULL,
	wtge	DECIMAL(5,2),
	avgmks	INT,
	avgdifi	INT,
	avgdifs	INT,		-- out of 5
	PRIMARY KEY (cid, ano),
	FOREIGN KEY (cid) 		REFERENCES course(cid)
	FOREIGN KEY (subbyi)	REFERENCES inst(iid),
);

CREATE TABLE studass
(
	sid		CHAR(9)			NOT NULL,
	cid		CHAR(7)			NOT NULL,
	ano		INT				NOT NULL,
	mks		INT,
	dif		INT,
	PRIMARY KEY (sid,cid,ano),
	FOREIGN KEY (sid)		REFERENCES stud(sid),
	FOREIGN KEY (cid,ano)	REFERENCES ass(cid,ano)
);

CREATE TABLE reg
(
	sid		CHAR(9)			NOT NULL,
	cid		CHAR(7)			NOT NULL,
	--other details like sem number, year, etc.
	PRIMARY KEY (sid,cid),
	FOREIGN KEY (sid) 		REFERENCES stud(sid),
	FOREIGN KEY (cid) 		REFERENCES course(cid)
);

CREATE TABLE teaches
(
	iid		CHAR(9)			NOT NULL,
	cid		CHAR(7)			NOT NULL,
	PRIMARY KEY (iid,cid),
	FOREIGN KEY (iid)		REFERENCES inst(iid),
	FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);

CREATE TABLE instass
(
	iid		CHAR(9)			NOT NULL,
	cid		CHAR(7)			NOT NULL,
	ano		INT				NOT NULL,
	dif		INT,
	PRIMARY KEY (iid,cid,ano),
	FOREIGN KEY (iid)		REFERENCES inst(iid),
	FOREIGN KEY (cid,ano)	REFERENCES ass(cid,ano)
);

--calendar of instr, chooses a course from a dropdown menu to see the due dates of asses of other courses taken by the studs of that course

--dropdown menu
SELECT c.cid, c.name
FROM courses c NATURAL JOIN teaches t
WHERE t.iid = giveniid;

--other courses of students enrolled in this course
--cid2 is the course chosen by the instructor from the drop down menu that is the given cid
CREATE VIEW cidcid(cid1,cid2) AS
SELECT DISTINCT r1.cid,r2.cid
FROM reg r1 INNER JOIN reg r2 ON (r1.sid=r2.sid);

CREATE VIEW nstudbycid(cid,nstuds) AS
SELECT r.cid, COUNT(r.sid)
FROM reg r
GROUP BY r.cid;

SELECT a.ps, a.ano, a.cid, a.duedt, a.avgdifi, n.nstuds
FROM cidcid c INNER JOIN (ass a, nstudbycid n) ON (c.cid1 = a.cid AND c.cid1 = n.cid)
WHERE c.cid2 = givencid
AND a.duedt > CURDATE();

--students calendar showing all the due assignments

SELECT a.ps, a.ano, a.cid, a.duedt, a.avgdifi, a.maxmks, sa.mks, sa.dif
FROM ass a NATURAL JOIN studass sa
WHERE sa.sid = givensid
AND a.duedt > CURDATE();


