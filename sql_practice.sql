CREATE DATABASE College;
USE College;
CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,grade VARCHAR(1),city varchar(20));
drop table student;
desc student;
SHOW DATABASES;
SHOW TABLES;

INSERT INTO student(rollno,name,marks,grade,city) 
VALUES 
(1,'Nivedita',78,'B','Solapur'),
(2,'Akanksha',89,'A','Satara'),
(3,'Harsh',96,'A','Pune'),
(4,'Rajat',70,'C','Nagpur'),
(5,'kaushik',68,'C','Pune'),
(6,'Tushar',78,'B','Baramati'),
(7,'Sukesh',56,'F','Solapur');
SELECT name,marks FROM student;
SELECT * FROM student;
SELECT DISTINCT city FROM student;/*DISTINCT : repeat values are not displayed*/
ALTER TABLE STUDENT ADD COLUMN AGE INT NOT NULL DEFAULT 22 ;
DROP TABLE STUDENT;

/*WHERE CLAUSE*/
SELECT * FROM student WHERE marks >80;
SELECT * FROM student WHERE city='solapur';
SELECT * FROM student WHERE marks >50 AND city='solapur';
SELECT * FROM student WHERE marks BETWEEN 60 AND 80;
SELECT * FROM student WHERE city IN ("Solapur","Satara");
SELECT * FROM student WHERE city NOT IN ("Solapur","Satara");
SELECT * FROM student WHERE marks > 75 LIMIT 3;

/* ORDER BY */
SELECT * FROM student ORDER BY city;
SELECT * FROM student ORDER BY city desc;
SELECT * FROM student ORDER BY marks desc LIMIT 3;

/* AGGREGATE FUNCTIONS :
COUNT()  MAX()	MIN()	SUM()	AVG()*/
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT COUNT(rollno) FROM student;

/*GROUP BY */
SELECT city,count(rollno) FROM student GROUP BY city;
SELECT city,avg(marks) FROM student GROUP BY city;
SELECT grade, COUNT(rollno) FROM student GROUP BY grade ORDER BY grade;
SELECT city ,COUNT(ROLLNO) FROM student GROUP BY city  
HAVING MAX(MARKS) > 75;
SELECT city FROM student WHERE grade = 'A' GROUP BY city 
HAVING MAX(MARKS) >=70 ORDER BY CITY;

SET SQL_SAFE_UPDATES=0;
UPDATE STUDENT SET GRADE='O' WHERE GRADE ='A';
SELECT * FROM STUDENT;

CREATE DATABASE Company;
use Company;
create table employee(id int primary key, name varchar(100), salary int);
insert into employee (id,name,salary)
values(1 ,'Rajat',25000),(2 ,'Kaushik',50000),(3 ,'Mili',56000);
desc employee;

CREATE TABLE DEPT(ID INT PRIMARY KEY, NAME VARCHAR(50)
);
INSERT INTO DEPT VALUES(101,"English"),(102,"IT");
SELECT * FROM DEPT;

CREATE TABLE TEACHER(ID INT PRIMARY KEY, NAME VARCHAR(50),
DEPT_ID INT, FOREIGN KEY (DEPT_ID) REFERENCES DEPT(ID)
ON UPDATE CASCADE
ON DELETE CASCADE);

INSERT INTO TEACHER VALUES(101,"Nivedita",101),
(102,"Harsh",102);
SELECT * FROM TEACHER;

UPDATE DEPT SET ID = 103 WHERE ID = 101 ;
DROP TABLE TEACHER;

/*Joins:*/
CREATE TABLE student1(id INT primary key, name varchar(50));
INSERT INTO student1(id,name) values (101,"abc"),(102,"pqr"),(103,"xyz");
SELECT * FROM student1;

CREATE TABLE course1(id int primary key, course VARCHAR(50));
INSERT INTO course1 (id,course) VALUES
(102,"English"),
(105,"Maths"),
(103,"Science"),
(107,"Computer Science");
SELECT * FROM STUDENT1;
SELECT * FROM course1;

/*INNER JOIN */
SELECT * FROM STUDENT1
INNER JOIN course1
ON STUDENT1.ID = course1.ID;

/*	OR
SELECT * FROM STUDENT1 as s
INNER JOIN course1 as c
ON s.ID = c.ID;
*/

/*Left JOIN */
SELECT * FROM STUDENT1
LEFT JOIN course1
ON STUDENT1.ID = course1.ID;

/*RIGHT JOIN */
SELECT * FROM STUDENT1
RIGHT JOIN course1
ON STUDENT1.ID = course1.ID;

/* FULL JOIN */
SELECT * FROM STUDENT1
LEFT JOIN course1
ON STUDENT1.ID = course1.ID
UNION
SELECT * FROM STUDENT1
RIGHT JOIN course1
ON STUDENT1.ID = course1.ID;

/* LEFT EXCLUSIVE JOIN*/
SELECT * FROM STUDENT1 AS S
LEFT JOIN COURSE1 AS C
ON S.ID = C.ID 
WHERE C.ID IS NULL;


/* RIGHT EXCLUSIVE JOIN*/
SELECT * FROM STUDENT1 AS S
RIGHT JOIN COURSE1 AS C
ON S.ID = C.ID 
WHERE S.ID IS NULL;


/* FULL EXCLUSIVE JOIN*/
SELECT * FROM STUDENT1 AS S
LEFT JOIN COURSE1 AS C
ON S.ID = C.ID 
WHERE C.ID IS NULL
UNION ALL 
SELECT * FROM STUDENT1 AS S
RIGHT JOIN COURSE1 AS C
ON S.ID = C.ID 
WHERE C.ID IS NULL;
;
/*Self Join*/
CREATE TABLE employee(
id INT PRIMARY KEY, name VARCHAR(50),manager_id INT);

INSERT INTO employee (id,name,manager_id) 
VALUES 
(101,"Ram",103),
(102,"Laxman",104),
(103,"Arjun",Null),
(104,"Sita",103);
select * from employee;
SELECT a.name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

/*UNION -> it gives unique value*/
SELECT name FROM employee 
UNION
SELECT name FROM employee; 

/*UNION ALL  -> it gives Duplicate or repeate value*/
SELECT name FROM employee 
UNION ALL
SELECT name FROM employee; 


/*SUB QUERY */
SELECT NAME,MARKS FROM STUDENT
 WHERE MARKS > (SELECT AVG(MARKS) FROM STUDENT);
 
 /*STEP 1:*/
 SELECT rollno FROM STUDENT WHERE rollno % 2=0;
  /*STEP 2:*/
 SELECT rollno,NAME FROM STUDENT WHERE rollno IN(2,4,6);
 
 
 SELECT NAME,rollno FROM STUDENT
 WHERE rollno IN
 (SELECT rollno FROM student WHERE ROLLNO % 2 =0);
 
 /*BY USING FROM*/
 SELECT MAX(MARKS) FROM
 (SELECT * FROM STUDENT WHERE CITY='SOLAPUR') AS TEMP;
 /*OR*/
 SELECT MAX(MARKS) FROM STUDENT WHERE CITY='PUNE';
 
 /*VIEW*/
 CREATE VIEW view1 AS 
 SELECT rollno,name,marks FROM STUDENT;
 SELECT * FROM view1 ;
SELECT * FROM view1 WHERE MARKS>80 ;
 DROP VIEW view1;