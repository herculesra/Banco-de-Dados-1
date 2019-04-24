-- QUESTÃO 1

SELECT COUNT(sex) FROM employee WHERE sex='F';

-- QUESTÃO 2

SELECT AVG(e.salary) FROM employee AS e WHERE e.sex='M' AND e.address LIKE '%TX';
