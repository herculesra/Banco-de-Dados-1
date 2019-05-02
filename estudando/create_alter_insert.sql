-- comando para criar um esquema:

CREATE SCHEMA nome_esquema;



CREATE TABLE nome_tabela:       -- cria uma nova relação pertencente ao esquema.
DROP TABLE nome_tabela;         -- deleta a tabela, caso ela seja referenciada, dará erro. Mas pode usar o CASCADE deopois do nome para ignorar a restrição.


-- comando para inserir valores na tabela:

INSERT INTO nome_tabela VALUES (atri1, atrb2,...,atribn);

