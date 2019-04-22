SELECT d.dname FROM department AS d, employee AS g WHERE d.mgrssn = g.ssn AND g.ssn LIKE '%5555';
