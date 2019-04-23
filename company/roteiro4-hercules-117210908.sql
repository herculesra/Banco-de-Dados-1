--QUESTÃO 1

SELECT * FROM department;

--Questão 2

SELECT * FROM dependent;

-- Questão 3

SELECT * FROM dept_locations;

-- QUESTÃO 4

SELECT * FROM employee;

-- QUESTÃO 5

SELECT * FROM project;

-- QUESTÃO 6

SELECT * FROM works_on;

-- QUESTÃO 7

SELECT fname,lname FROM EMPLOYEE WHERE sex='M';

-- QUESTÃO 8

SELECT fname  FROM EMPLOYEE WHERE superssn is NULL;

-- QUESTÃO 9

SELECT e.fname AS Emp_Name, s.fname AS Super_Name FROM EMPLOYEE AS e, EMPLOYEE AS s WHERE e.superssn = s.ssn;

-- QUESTÃO 10

SELECT e.fname AS Emp_fname FROM EMPLOYEE AS e, EMPLOYEE AS s WHERE e.superssn = s.ssn AND s.fname = 'Franklin';

-- QUESTÃO 11

SELECT d.dname AS nome, dlocation AS localizacao FROM department AS d, dept_locations AS dpt_l WHERE d.dnumber = dpt_l.dnumber; 

-- QUESTÃO 12

SELECT d.dname AS nome, dlocation AS localizacao FROM department AS d, dept_locations AS dpt_l WHERE d.dnumber = dpt_l.dnumber AND dpt_l.dlocation LIKE 'S%'; 

-- QUESTÃO 13

SELECT e.fname AS emp_name, e.lname AS emp_lname, d.dependent_name FROM employee AS e, dependent AS d WHERE d.essn = e.ssn; 

-- QUESTÃO 14

SELECT e.fname || ' ' || e.minit || ' ' ||e.lname AS fullname, e.salary FROM EMPLOYEE AS e WHERE e.salary > 50000;

-- QUESTÃO 15

SELECT p.pname, d.dname FROM project AS p, department AS d WHERE p.dnum = d.dnumber;

-- QUESTÃO 16

SELECT p.pname, g.fname FROM project AS p, department AS d, employee AS g WHERE p.dnum = d.dnumber AND g.ssn = d.mgrssn AND p.pnumber > 30;


-- QUESTÃO 17

SELECT p.pname, e.fname FROM project AS p, employee AS e, works_on WHERE e.ssn = essn AND pnumber = pno; 

-- QUESTÃO 18

SELECT e.fname, dpd.dependent_name, dpd.relationship FROM employee AS e, dependent AS dpd, works_on AS w, project AS p WHERE  e.ssn = w.essn AND p.pnumber = 91 AND w.pno = 91 AND dpd.essn = e.ssn;


