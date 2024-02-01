/*
    SQL QUERY PROJECT     3 tables will be created for this Project -- STUDIES, SOFTWARE & PROGRAMMER

 Creating a separate database for the Project
 */

CREATE DATABASE SQL_QUERY_PROJECT

USE SQL_QUERY_PROJECT


-- Creating the tables 

--TABLE 1 - STUDIES
CREATE TABLE STUDIES 
(
	PNAME varchar(20)
	, INSTITUTE varchar(20)
	, COURSE varchar(20)
	, COURSE_FEE int 
)


INSERT INTO STUDIES VALUES
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000)

SELECT * FROM STUDIES

--TABLE 2 SOFTWARE
CREATE TABLE SOFTWARE 
(
	PNAME varchar(20)
	, TITLE varchar(20)
	, DEVELOPIN varchar(20)
	, SCOST decimal(10,2)
	, DCOST int
	, SOLD int
)


INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',300, 1200, 84), 
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4), 
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6)

SELECT * FROM SOFTWARE

--TABLE3 PROGRAMMER
CREATE TABLE PROGRAMMER 
(
	PNAME varchar(20)
	, DOB date
	, DOJ date
	, GENDER varchar(1)
	, PROF1 varchar(20)
	, PROF2 varchar(20)
	, SALARY int
)


INSERT INTO PROGRAMMER VALUES
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500)

SELECT * FROM PROGRAMMER


-- 1. Find out the selling cost AVG for packages developed in Pascal.

SELECT AVG(SCOST) AS SellingCostAVG 
FROM SOFTWARE
WHERE DEVELOPIN = 'PASCAL'

-- 2. Display Names, Ages of all Programmers.

SELECT PNAME, YEAR(GETDATE())-YEAR(DOB) AS AGE
FROM PROGRAMMER

-- 3. Display the Names of those who have done the DAP Course.

SELECT PNAME
FROM STUDIES
WHERE COURSE = 'DAP'

-- 4. Display the Names and Date of Births of all Programmers Born in January.

SELECT PNAME, DOB
FROM PROGRAMMER
WHERE MONTH(DOB) = 1

-- 5. What is the Highest Number of copies sold by a Package?

SELECT MAX(SOLD) AS CopiesSold
FROM SOFTWARE

-- 6. Display lowest course Fee.

SELECT MIN(COURSE_FEE) AS LowestCourseFee
FROM STUDIES

-- 7. How many programmers done the PGDCA Course?

SELECT PNAME, COURSE 
FROM STUDIES 
WHERE COURSE = 'PGDCA'

-- 8. How much revenue has been earned thru sales of Packages Developed in C. 

SELECT DEVELOPIN, SUM(SCOST * SOLD) AS REVENUE
FROM SOFTWARE
WHERE DEVELOPIN = 'C'
GROUP BY DEVELOPIN

-- 9. Display the Details of the Software Developed by Ramesh.

SELECT TITLE 
FROM SOFTWARE
WHERE PNAME = 'RAMESH'

-- 10. How many Programmers Studied at Sabhari?

SELECT COUNT(INSTITUTE)
FROM STUDIES
WHERE INSTITUTE = 'Sabhari' 

-- 11. Display details of Packages whose sales crossed the 2000 Mark.

SELECT * FROM
(
	SELECT TITLE, SUM(SCOST * SOLD) AS SALES
	FROM SOFTWARE
	GROUP BY TITLE
) AS x
WHERE SALES > 2000

-- 12. Display the Details of Packages for which Development Cost have been recovered. 

SELECT *, (SCOST * SOLD) AS REVENUE
FROM SOFTWARE
WHERE (SCOST * SOLD) >= DCOST

/*
SELECT *, (SCOST * SOLD) AS REVENUE
FROM SOFTWARE
WHERE (SCOST * SOLD) <= DCOST
*/
--SELECT * FROM SOFTWARE

-- 13. What is the cost of the costliest software development in Basic?

SELECT MAX(DCOST) AS DCOST
FROM SOFTWARE
WHERE DEVELOPIN = 'BASIC'

-- 14. How many Packages Developed in DBASE?

SELECT COUNT(DEVELOPIN) AS COUNT
FROM SOFTWARE
WHERE DEVELOPIN = 'DBASE'

-- 15. How many programmers studied in Pragathi?

SELECT COUNT(INSTITUTE)
FROM STUDIES
WHERE INSTITUTE = 'Pragathi' 

-- 16. How many Programmers Paid 5000 to 10000 for their course?

SELECT COUNT(COURSE_FEE) AS COUNT
FROM STUDIES
WHERE COURSE_FEE BETWEEN 5000 AND 10000

-- 17. What is AVG Course Fee

SELECT AVG(COURSE_FEE) AS AVGCourseFee
FROM STUDIES

-- 18. Display the details of the Programmers Knowing C.

SELECT *
FROM PROGRAMMER
WHERE PROF1 = 'C' OR PROF2 = 'C'

-- 19. How many Programmers know either COBOL or PASCAL.

SELECT *
FROM PROGRAMMER
WHERE PROF1 = 'COBOL' OR PROF2 = 'COBOL' OR PROF1 = 'PASCAL' OR PROF2 = 'PASCAL'

-- 20. How many Programmers Don’t know PASCAL and C

SELECT *
FROM PROGRAMMER
WHERE PROF1 != 'C' AND PROF2 != 'C' AND PROF1 != 'PASCAL' AND PROF2 != 'PASCAL'

-- 21. How old is the Oldest Male Programmer.

SELECT MAX(AGE) AS AGE FROM
(
	SELECT PNAME, YEAR(GETDATE())-YEAR(DOB) AS AGE
	FROM PROGRAMMER
	WHERE GENDER = 'M'
) AS x

-- 22. What is the AVG age of Female Programmers?

SELECT AVG(AGE) AS AvgAgeOfFemales FROM
(
	SELECT PNAME, YEAR(GETDATE())-YEAR(DOB) AS AGE
	FROM PROGRAMMER
	WHERE GENDER = 'F'
) AS x

-- 23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.

SELECT PNAME, YEAR(GETDATE())-YEAR(DOJ) AS EXPERIENCE 
FROM PROGRAMMER
ORDER BY EXPERIENCE DESC

-- 24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
SELECT * FROM 
(
	SELECT PNAME, MONTH(DOB) AS BDayMonth
	FROM PROGRAMMER
) AS x
WHERE MONTH(GETDATE()) = BDayMonth

-- 25. How many Female Programmers are there?

SELECT COUNT(GENDER) AS FemaleEmployees
FROM PROGRAMMER
WHERE GENDER = 'F' 

-- 26. What are the Languages studied by Male Programmers.

SELECT PNAME, PROF1, PROF2
FROM PROGRAMMER
WHERE GENDER = 'M'

-- 27. What is the AVG Salary?

SELECT AVG(SALARY) AS AvgSalary
FROM PROGRAMMER

-- 28. How many people draw salary 2000 to 4000?

SELECT COUNT(SALARY) AS COUNT
FROM PROGRAMMER
WHERE SALARY BETWEEN 2000 AND 4000

-- 29. Display the details of those who don’t know Clipper, COBOL or PASCAL.

SELECT *
FROM PROGRAMMER
WHERE PROF1 != 'Clipper' AND PROF2 != 'Clipper' AND PROF1 != 'COBOL' AND PROF2 != 'COBOL' AND PROF1 != 'PASCAL' AND PROF2 != 'PASCAL'

-- 30. Display the Cost of Package Developed By each Programmer.

SELECT PNAME, SUM(DCOST) AS COST
FROM SOFTWARE
GROUP BY PNAME

-- 31. Display the sales values of the Packages Developed by the each Programmer.

SELECT PNAME, SUM(SCOST * SOLD) AS COST
FROM SOFTWARE
GROUP BY PNAME

-- 32. Display the Number of Packages sold by Each Programmer.

SELECT PNAME, SUM(SOLD) AS PackagesSOLD
FROM SOFTWARE
GROUP BY PNAME

-- 33. Display the sales cost of the packages Developed by each Programmer Language wise. 

SELECT DEVELOPIN, SUM(SCOST)
FROM SOFTWARE
GROUP BY DEVELOPIN

-- 34. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
 
 SELECT PNAME, MAX(DCOST) AS Costliest, MIN(DCOST) AS Cheapest
 FROM SOFTWARE
 GROUP BY PNAME

-- 35. Display each institute name with number of Courses, Average Cost per Course.

SELECT INSTITUTE, COUNT(DISTINCT(COURSE)) AS Number_of_Courses, SUM(DISTINCT(COURSE_FEE))/COUNT(DISTINCT(COURSE)) AS Average_Cost_per_Course
FROM STUDIES
GROUP BY INSTITUTE

-- 36. Display each institute Name with Number of Students.

SELECT INSTITUTE, COUNT(PNAME)
FROM STUDIES
GROUP BY INSTITUTE

-- 37. Display Names of Male and Female Programmers. Gender also.

SELECT PNAME, GENDER
FROM PROGRAMMER

-- 38. Display the Number of Packages in Each Language Except C and C++.

SELECT DEVELOPIN, COUNT(TITLE) AS Number_of_Packages
FROM SOFTWARE
WHERE DEVELOPIN <> 'C' AND DEVELOPIN <> 'C++'
GROUP BY DEVELOPIN

-- 39. Display the Number of Packages in Each Language for which Development Cost is less than 1000.

SELECT DEVELOPIN, COUNT(TITLE) AS Number_of_Packages
FROM SOFTWARE
WHERE DCOST < 1000
GROUP BY DEVELOPIN

-- 40. Display AVG Difference between SCOST, DCOST for Each Package.

SELECT TITLE, AVG(DCOST-SCOST) AS Diffrence
FROM SOFTWARE
GROUP BY TITLE

-- 41. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 

SELECT PNAME, SUM(SCOST) AS SCOST, SUM(DCOST) AS DCOST, SUM(DCOST) - (SUM(SCOST) * SUM(SOLD)) AS LossToBeRecoverd
FROM SOFTWARE
GROUP BY PNAME
HAVING SUM(DCOST) - (SUM(SCOST) * SUM(SOLD)) > (SUM(SCOST) * SUM(SOLD))

-- 42. Display Highest, Lowest and Average Salaries for those earning more than 2000.

SELECT MAX(SALARY) AS HIGHEST, MIN(SALARY) AS LOWEST, AVG(SALARY) AS AVG
FROM PROGRAMMER
WHERE SALARY > 2000
 
-- 43. Who is the Highest Paid C Programmers?

SELECT TOP 2 * FROM
(
	SELECT PNAME, MAX(SALARY) AS HIGHEST_SALARY 
	FROM PROGRAMMER
	WHERE PROF1 = 'C' OR PROF2 = 'C'
	GROUP BY PNAME
) AS x 
ORDER BY HIGHEST_SALARY DESC

-- 44. Who is the Highest Paid Female COBOL Programmer?

SELECT TOP 1 * FROM
(
	SELECT PNAME, MAX(SALARY) AS HIGHEST_SALARY 
	FROM PROGRAMMER
	WHERE GENDER = 'F' AND (PROF1 = 'COBOL' OR PROF2 = 'COBOL') 
	GROUP BY PNAME
) AS x 
ORDER BY HIGHEST_SALARY DESC

-- 45. Who is the least experienced Programmer.

SELECT TOP 2 * FROM 
(
	SELECT PNAME, YEAR(GETDATE())-YEAR(DOJ) AS EXPERIENCE
	FROM PROGRAMMER
) AS x
ORDER BY EXPERIENCE ASC

-- 46. Who is the most experienced male programmer knowing PASCAL.

SELECT TOP 1 * FROM 
(
	SELECT PNAME, YEAR(GETDATE())-YEAR(DOJ) AS EXPERIENCE
	FROM PROGRAMMER
	WHERE GENDER = 'M' AND (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL')
) AS x
ORDER BY EXPERIENCE DESC

-- 47. Who is the Youngest Programmer knowing DBASE?

SELECT TOP 1 * FROM 
(
	SELECT PNAME, YEAR(GETDATE())-YEAR(DOB) AS AGE
	FROM PROGRAMMER
	WHERE PROF1 = 'DBASE' OR PROF2 = 'DBASE'
) AS x
ORDER BY AGE ASC

-- 48. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?

SELECT * FROM 
(
	SELECT PNAME, SALARY
	FROM PROGRAMMER
	WHERE GENDER = 'F' AND (PROF1 != 'C' AND PROF2 != 'C' AND PROF1 != 'C++' AND PROF2 != 'C++' AND  PROF1 != 'ORACLE' AND PROF2 != 'ORACLE' AND PROF1 != 'DBASE' AND PROF2 != 'DBASE')
) AS x
WHERE SALARY > 3000

-- 49. Which Institute has most number of Students?

SELECT INSTITUTE, COUNT(INSTITUTE) AS Number_of_Students
FROM STUDIES 
GROUP BY INSTITUTE
ORDER BY Number_of_Students DESC

-- 50. What is the Costliest course?

SELECT COURSE, MAX(COURSE_FEE) AS FEE
FROM STUDIES
GROUP BY COURSE
ORDER BY FEE DESC

-- 51. Which course has been done by the most of the Students?

SELECT COURSE, COUNT(COURSE) AS COUNT
FROM STUDIES 
GROUP BY COURSE
ORDER BY COUNT DESC

-- 52. Which Institute conducts costliest course.

SELECT INSTITUTE, MAX(COURSE_FEE) AS FEE
FROM STUDIES
GROUP BY INSTITUTE
ORDER BY FEE DESC

-- 53. Display the name of the Institute and Course, which has below AVG course fee. 

SELECT DISTINCT INSTITUTE, COURSE
FROM STUDIES
WHERE (SELECT AVG(COURSE_FEE) FROM STUDIES) > COURSE_FEE

-- 54. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee. 

SELECT * FROM
(
SELECT COURSE, SUM(COURSE_FEE) AS COURSE_FEE
FROM STUDIES
GROUP BY COURSE
) AS x
WHERE (SELECT AVG(COURSE_FEE) - 1000 FROM STUDIES) < COURSE_FEE AND COURSE_FEE < (SELECT AVG(COURSE_FEE) + 1000 FROM STUDIES) 

-- 55. Which package has the Highest Development cost?

SELECT TOP 1 * FROM 
(
SELECT TITLE, MAX(DCOST) AS DCOST
FROM SOFTWARE 
GROUP BY TITLE
) AS x
ORDER BY DCOST DESC

-- 56. Which course has below AVG number of Students?

SELECT COURSE, COUNT(INSTITUTE) AS STUDENTS
FROM STUDIES
GROUP BY COURSE
HAVING COUNT(INSTITUTE) > COUNT(INSTITUTE)/COUNT(INSTITUTE)

-- 57. Which Package has the lowest selling cost?

SELECT TOP 1 * FROM 
(
SELECT TITLE, MIN(SCOST) AS SCOST
FROM SOFTWARE 
GROUP BY TITLE
) AS x
ORDER BY SCOST ASC

-- 58. Who Developed the Package that has sold the least number of copies?

SELECT TOP 1 * FROM 
(
SELECT PNAME, MIN(SOLD) AS COPIES
FROM SOFTWARE 
GROUP BY PNAME
) AS x
ORDER BY COPIES ASC

-- 59. Which language has used to develop the package, which has the highest sales amount?

SELECT TOP 1 * FROM 
(
SELECT DEVELOPIN, (SCOST * SOLD) AS SalesAmount
FROM SOFTWARE
) AS x
ORDER BY SalesAmount DESC 

-- 60. How many copies of package that has the least difference between development and selling cost where sold.

SELECT TOP 1 * FROM 
(
SELECT SOLD, (DCOST-SCOST) AS Difference
FROM SOFTWARE
) AS x
ORDER BY Difference ASC

-- 61. Which is the costliest package developed in PASCAL. 

SELECT DEVELOPIN, MAX(DCOST)
FROM SOFTWARE 
WHERE DEVELOPIN = 'PASCAL'
GROUP BY DEVELOPIN

-- 62. Which language was used to develop the most number of Packages.

SELECT TOP 1 * FROM 
(
SELECT DEVELOPIN, COUNT(TITLE) AS COUNT
FROM SOFTWARE
GROUP BY DEVELOPIN 
) AS x
ORDER BY COUNT DESC

-- 63. Which programmer has developed the highest number of Packages? 

SELECT TOP 1 * FROM 
(
SELECT PNAME, COUNT(TITLE) AS COUNT
FROM SOFTWARE
GROUP BY PNAME 
) AS x
ORDER BY COUNT DESC


-- 64. Who is the Author of the Costliest Package?

SELECT TOP 1 * FROM 
(
SELECT PNAME, MAX(DCOST) AS COST
FROM SOFTWARE
GROUP BY PNAME 
) AS x
ORDER BY COST DESC


-- 65. Display the names of the packages, which have sold less than the AVG number of copies.

SELECT TITLE
FROM SOFTWARE
WHERE (SELECT AVG(SOLD) FROM SOFTWARE) > SOLD

-- 66. Who are the authors of the Packages, which have recovered more than double the Development cost?

SELECT PNAME, (2 * SUM(DCOST)) AS DCOSTx2 , SUM(SCOST * SOLD) AS REVENUE, SUM(SCOST * SOLD) - (2 * SUM(DCOST)) ExtraAmountRecovered 
FROM SOFTWARE
GROUP BY PNAME
HAVING  (2 * SUM(DCOST)) < SUM(SCOST*SOLD)

-- 67. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.

SELECT DEVELOPIN, MAX(SOLD) AS Highest_Selling, MIN(SOLD) AS Lowest_selling
FROM SOFTWARE
GROUP BY DEVELOPIN

-- 68. Who is the youngest male Programmer born in 1965? 

SELECT TOP 1 * FROM
(
SELECT PNAME, DOB
FROM PROGRAMMER
WHERE GENDER = 'M' AND YEAR(DOB) = 1965 
) AS x
ORDER BY DOB ASC

-- 69. Who is the oldest Female Programmer who joined in 1992?

SELECT PNAME
FROM PROGRAMMER
WHERE GENDER = 'F' AND YEAR(DOJ) = 1992 

-- 70. In which year was the most number of Programmers born.

SELECT TOP 1 * FROM 
(
	SELECT YEAR(DOB) AS YEAR, COUNT(YEAR(DOB)) AS COUNT
	FROM PROGRAMMER
	GROUP BY YEAR(DOB)
)AS x
ORDER BY COUNT DESC

-- 71. In which month did most number of programmers join?

SELECT TOP 1 * FROM 
(
	SELECT MONTH(DOJ) AS MONTH, COUNT(MONTH(DOJ)) AS COUNT
	FROM PROGRAMMER
	GROUP BY MONTH(DOJ)
)AS x
ORDER BY COUNT DESC

-- 72. Who are the male programmers earning below the AVG salary of Female Programmers?

SELECT PNAME, GENDER, SALARY, (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F') AS Avg_salary_of_Female_Programmers
FROM PROGRAMMER
WHERE SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F') AND GENDER = 'M'

-- 73. Who are the Female Programmers earning more than the Highest Paid MALE PROGRAMMER?

SELECT PNAME, GENDER, SALARY, (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M') AS Highest_Paid_MALE_PROGRAMMER
FROM PROGRAMMER
WHERE SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M') AND GENDER = 'F'

-- 74. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.

SELECT *
FROM SOFTWARE AS SOFT
INNER JOIN PROGRAMMER AS PROG ON PROG.PNAME = SOFT.PNAME
WHERE GENDER = 'M' AND SALARY > 3000

-- 75. Display the details of the packages developed in Pascal by the Female Programmers.

SELECT *
FROM SOFTWARE AS SOFT
INNER JOIN PROGRAMMER AS PROG ON PROG.PNAME = SOFT.PNAME
WHERE GENDER = 'F' AND DEVELOPIN = 'PASCAL'

-- 76. Display the details of the Programmers who joined before 1990.

SELECT * 
FROM PROGRAMMER
WHERE YEAR(DOJ) < 1990

-- 77. Display the details of the Software Developed in C By female programmers of Pragathi.

SELECT *
	FROM PROGRAMMER AS PROG
	INNER JOIN SOFTWARE AS SOFT ON PROG.PNAME = SOFT.PNAME 
	INNER JOIN STUDIES ON STUDIES.PNAME = SOFT.PNAME
	WHERE GENDER = 'F' AND DEVELOPIN = 'C' AND INSTITUTE = 'Pragathi' 

-- 78. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

SELECT * FROM 
(
SELECT PNAME, COUNT(TITLE) AS No_of_Packages, SUM(SOLD) AS No_of_Copies_Sold, SUM(SCOST * SOLD) AS Sales
FROM SOFTWARE
GROUP BY PNAME
) AS x
LEFT JOIN STUDIES ON STUDIES.PNAME = x.PNAME

-- 79. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.

SELECT * FROM 
(
SELECT *
FROM SOFTWARE
WHERE DEVELOPIN = 'DBASE'
) AS x
INNER JOIN PROGRAMMER ON PROGRAMMER.PNAME = x.PNAME
INNER JOIN STUDIES ON STUDIES.PNAME = PROGRAMMER.PNAME
WHERE GENDER = 'M' 

-- 80. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975.

SELECT * FROM 
(
SELECT * 
FROM PROGRAMMER
WHERE (GENDER = 'M' AND YEAR(DOB) < 1965) OR (GENDER = 'F' AND YEAR(DOB) > 1975) 
) AS x
INNER JOIN SOFTWARE ON SOFTWARE.PNAME = x.PNAME

-- 81. Display the details of the software developed by the male students of Sabhari.

SELECT * 
FROM SOFTWARE AS SOFT
INNER JOIN PROGRAMMER AS PROG ON PROG.PNAME = SOFT.PNAME
INNER JOIN STUDIES ON STUDIES.PNAME = PROG.PNAME
WHERE GENDER = 'M' AND INSTITUTE = 'Sabhari' 

-- 82. Display the names of the programmers who have not developed any packages.

SELECT PROGRAMMER.PNAME 
FROM PROGRAMMER
LEFT JOIN SOFTWARE ON SOFTWARE.PNAME = PROGRAMMER.PNAME 
WHERE SOFTWARE.PNAME IS NULL 

-- 83. What is the total cost of the Software developed by the programmers of Apple?

SELECT COST FROM 
(
SELECT PNAME, SUM(DCOST) AS COST
FROM SOFTWARE
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME
WHERE INSTITUTE = 'APPLE'

-- 84. Display the total sales value of the software, institute wise.

SELECT INSTITUTE, COST FROM 
(
SELECT PNAME, SUM(SCOST*SOLD) AS COST
FROM SOFTWARE
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME

-- 85. In which institute does the person who developed the costliest package studied.

SELECT INSTITUTE, COST FROM 
(
SELECT PNAME, MAX(DCOST) AS COST
FROM SOFTWARE
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME
ORDER BY COST DESC

-- 86. Which language listed in prof1, prof2 has not been used to develop any package.

SELECT * FROM
(
SELECT DISTINCT PNAME, DEVELOPIN
FROM SOFTWARE 
)AS x
INNER JOIN PROGRAMMER ON PROGRAMMER.PNAME = x.PNAME
WHERE DEVELOPIN <> PROF1 AND DEVELOPIN <> PROF2 

-- 87. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.

SELECT x.PNAME, Packages_Sold, SALARY, COURSE FROM 
(
SELECT PNAME, MAX(SOLD) AS Packages_Sold
FROM SOFTWARE 
GROUP BY PNAME
) AS x
INNER JOIN PROGRAMMER ON PROGRAMMER.PNAME = x.PNAME
LEFT JOIN STUDIES ON PROGRAMMER.PNAME = STUDIES.PNAME
ORDER BY Packages_Sold DESC

-- 88. What is the AVG salary for those whose software sales is more than 50,000/-. 

SELECT AVG(SALARY) AS AvgSalary FROM 
(
SELECT PNAME, SUM(SCOST*SOLD) AS SALES
FROM SOFTWARE
GROUP BY PNAME
HAVING SUM(SCOST*SOLD) > 50000
)AS x
INNER JOIN PROGRAMMER ON PROGRAMMER.PNAME = x.PNAME

-- 89. How many packages were developed by students, who studied in institute that charge the lowest course fee?

SELECT COUNT(TITLE) AS COUNT FROM
(
SELECT PNAME, COURSE_FEE
FROM STUDIES
)AS x
INNER JOIN SOFTWARE ON x.PNAME = SOFTWARE.PNAME
WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE)FROM STUDIES)

-- 90. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?

SELECT x.PNAME, Cheapest_Package, No_of_Packages_Developed, INSTITUTE FROM 
(
SELECT PNAME, MIN(DCOST) AS Cheapest_Package, COUNT(TITLE) AS No_of_Packages_Developed
FROM SOFTWARE 
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME
ORDER BY Cheapest_Package ASC

-- 91. How many packages were developed by the female programmers earning more than the highest paid male programmer?

SELECT x.PNAME, COUNT, GENDER, SALARY, (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M') AS Max_Salary_of_MALE FROM 
(
SELECT PNAME, COUNT(TITLE) AS COUNT
FROM SOFTWARE AS SOFT
GROUP BY PNAME
) AS x
INNER JOIN PROGRAMMER AS PROG ON PROG.PNAME = x.PNAME
WHERE GENDER = 'F' AND SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M')

-- 92. How many packages are developed by the most experienced programmer from BDPS.

SELECT x.PNAME, COUNT, INSTITUTE, YEAR(GETDATE()) - YEAR(DOJ) AS EXPERIENCE FROM
(
SELECT PNAME, COUNT(TITLE) AS COUNT
FROM SOFTWARE 
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME
INNER JOIN PROGRAMMER AS PROG ON PROG.PNAME = STUDIES.PNAME
WHERE INSTITUTE = 'BDPS' 

-- 93. List the programmers (from the software table) and the institutes they studied.

SELECT x.PNAME, INSTITUTE FROM 
(
SELECT PNAME 
FROM SOFTWARE
GROUP BY PNAME
) AS x
INNER JOIN STUDIES ON STUDIES.PNAME = x.PNAME
 
-- 94. List the programmer names (from the programmer table) and No. Of Packages each has developed. 

SELECT x.PNAME, COUNT(TITLE) AS Packages_Developed FROM 
(
SELECT PNAME 
FROM PROGRAMMER 
) AS x
LEFT JOIN SOFTWARE ON SOFTWARE.PNAME = x.PNAME
GROUP BY x.PNAME
ORDER BY Packages_Developed
