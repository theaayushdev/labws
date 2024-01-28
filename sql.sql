--e. To find the name of movie watched by viewerID 1.

SELECT T.viewerID,T.movieID, M.movieName
FROM Tickets AS T JOIN Movies AS M ON T.movieID = M.movieID
WHERE viewerID = 1
--lab 2

--b. To find department of employee "Jack"

SELECT E.ename,D.dname
FROM Works AS W
JOIN Employee AS E ON W.empno = E.empno 
JOIN Department  AS D ON W.deptno = D.deptno

WHERE E.ename = 'JACK'

--c To decrease salary of employees by 10% whose salary is greater than 15,000
UPDATE Employee
SET salary = salary - (0.1*salary)
WHERE salary >15000

--d To add a department to the database
INSERT INTO Department
VALUES
('6','Electronic','Bhaktapur')

--e To find the number of employees in physics department
SELECT COUNT(*) AS Population
FROM Employee AS E 
JOIN Works AS W ON E.empno = W.empno
JOIN Department AS D ON D.deptno = W.deptno

WHERE dname = 'Physics'

--f To delete records of all employees whose city is 'Kathmandu'

DELETE FROM Employee
WHERE empno IN (
    SELECT E.empno
    FROM Employee AS E
    JOIN Works AS W ON E.empno = W.empno
    JOIN Department AS D ON W.deptno = D.deptno
    WHERE D.city = 'Kathmandu'
);

-- lab3
--b To find the name and phone number of all applicants
SELECT DISTINCT(A.fullname),A.phone
FROM Applicant AS A
JOIN Application_Submission AS A_S  
ON A.AID = A_S.AID

--c Delete all the companies which have never posted any job.
DELETE FROM Company 
FROM Company LEFT JOIN Jobs ON Company.CID = Jobs.CID
WHERE Jobs.CID IS NULL


--d To find how many applications were submitted on '2018-08-01'
SELECT COUNT(A.AID) AS Submissions
FROM Applicant as A 
JOIN Application_Submission AS A_S 
ON A.AID = A_S.AID
WHERE A_S.SubmittedDate = '2018-08-01'

--e To find how many jobs were submitted by each company

SELECT C.CName, COUNT(C.CID) AS Jobs_Submitted 
FROM Company as C
JOIN Jobs AS J
ON C.CID = J.CID 
GROUP BY C.CName,J.CID 

--lab 4
--d. Find the name of teacher who teaches CO subject to Ayush

SELECT S.SName,T.TName,T.Tsubject
FROM Teachers AS T
JOIN College AS C 
ON T.TID = C.TID
JOIN Student AS S 
ON S.RollNo = C.RollNo
WHERE S.SName = 'Ayush' AND T.Tsubject = 'CO'

--lab 5

-- ques no c
SELECT c.Categoryname, SUM(e.amount) AS total_amount
 FROM categories c
 JOIN Expenses e ON c.categoryID = e.categoryID
 GROUP BY c.Categoryname
 ORDER BY total_amount DESC
 LIMIT 5
 ;

 -- ques no d
 SELECT c.Categoryname
 FROM categories c
 LEFT JOIN Expenses e ON c.categoryID = e.categoryID
 WHERE e.categoryID IS not NULL;

-- ques no e
select username
from users join expenses on expenses.userid=users.userid
where expenses.amount>(select max(amount) from expenses where userid=2);