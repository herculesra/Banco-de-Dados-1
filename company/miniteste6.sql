SELECT d.dname FROM department AS d, employee AS g WHERE d.mgrssn = g.ssn AND g.ssn LIKE '%5555';

-- perdi 4 pontos por fazer join desnecessário...begin

-- Forma correta:

SELECT d.dname FROM department AS d WHERE d.mgrssn LIKE '%5555';


