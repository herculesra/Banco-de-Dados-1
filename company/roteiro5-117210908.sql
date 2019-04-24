-- QUESTÃO 1

SELECT COUNT(sex) FROM employee WHERE sex='F';

-- QUESTÃO 2

SELECT AVG(e.salary) FROM employee AS e WHERE e.sex='M' AND e.address LIKE '%TX';

-- QUESTÃO 3

SELECT s.ssn AS ssn_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s RIGHT OUTER JOIN employee AS e ON s.ssn = e.superssn
GROUP BY s.ssn
ORDER BY qtd_supervisionados ASC;

-- QUESTÃO 4

SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s JOIN employee AS e ON e.superssn = s.ssn
GROUP BY s.fname
ORDER BY qtd_supervisionados ASC;

-- QUESTÃO 5

SELECT s.fname AS nome_supervisor, COUNT(*) AS qtd_supervisionados
FROM employee AS s RIGHT OUTER JOIN employee AS e ON e.superssn = s.ssn
GROUP BY s.fname
ORDER BY qtd_supervisionados ASC;

-- QUESTÃO 6

SELECT MIN(r.COUNT) AS qtd FROM (SELECT pno, COUNT(*) FROM works_on GROUP BY pno) AS r;


