CREATE TABLE laboratorio(
	id serial PRIMARY KEY,
	nome character varying(50) not null,
	descricao character varying(100)
);

CREATE TABLE projeto(
	id SERIAL PRIMARY KEY,
	titulo character varying(100) not null,
	descricao character varying(100),
	data_inicio date not null,
	data_fim date,
	id_laboratorio integer not null references laboratorio(id) 
);

CREATE TABLE aluno(
	matricula character(9) PRIMARY KEY,
	nome character varying(100) not null,
	cra numeric  not null,
	dt_nasc date not null,
	id_projeto integer not null references projeto(id)

);

INSERT INTO laboratorio (nome, descricao) VALUES
('Embedded', 'Sistemas Embarcados e Computação Pervasiva'),
('SPLab', 'Software Practices Laboratory');


INSERT INTO projeto (titulo, descricao, data_inicio, id_laboratorio) VALUES
('VTEX IO', 'O VTEX IO é uma plataforma de desenvolvimento serverless', '2018-03-09', 2),
('ePol', 'Parceria com o Departamento de Polícia Federal', '2011-03-09', 2),
('Capacitação Asus', 'Desenvolvimento e Capacitação de Alunos', '2016-06-12', 1),
('Capacitação Nokia', 'Desenvolvimento e Capacitação de Alunos', '2016-07-10', 1);

INSERT INTO aluno (matricula, nome, cra, dt_nasc, id_projeto) VALUES
('11710245', 'Thayanne', 9.2, '2000-01-07', 1),
('11710236', 'Rodrigo', 8.6, '2000-04-04', 1),
('11720221', 'Mateus', 7.7, '1998-07-17', 1),
('11720223', 'Italo', 7.5, '1997-02-20', 1),
('11510271', 'João', 8.2, '1992-01-13', 1),
('11510280', 'Marcos', 8.6, '1993-04-22', 2),
('11520219', 'André', 7.7, '1992-01-19', 2),
('11520271', 'Tiago', 7.5, '1992-01-18', 2),
('11610223', 'Felipe', 7.2, '1997-01-05', 3),
('11610240', 'Rafael', 8.8, '1996-04-01', 3),
('11620233', 'Joaquim', 9.0, '1997-07-14', 3),
('11620218', 'Diego', 7.3, '1996-02-21', 3),
('11610224', 'Felipe', 7.2, '1997-08-27', 4),
('11610241', 'Rafael', 8.2, '1996-05-13', 4),
('11620237', 'Joaquim', 9.0, '1998-02-03', 4),
('11620219', 'Diego', 7.3, '1996-03-04', 4);


