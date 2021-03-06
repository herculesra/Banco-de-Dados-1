-- 1° questão
-- criacao da tabela tarefas
-- iserções de valores

CREATE TABLE tarefas(
	id_tarefa INTEGER,
	descricao TEXT,
	func_resp_cpf VARCHAR(11),
	prioridade INTEGER,
	status CHAR(1)
);

INSERT INTO tarefas VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'F');

INSERT INTO tarefas VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'F');

INSERT INTO tarefas VALUES (null, null, null, null, null);

-- Inserções que não devem ser permitidas:

INSERT INTO tarefas VALUES (2147483644, 'limpar chão do corredor superior', '987654323211', 0, 'F');

INSERT INTO tarefas VALUES (2147483643, 'limpar chão do corredor superior', '98765432321', 0, 'FF');


-- 2° Questão

INSERT INTO tarefas VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');

-- erro detectado ao tentar inserir (inteiro não é suficiente)
-- correção:

ALTER TABLE tarefas ALTER COLUMN id_tarefa TYPE BIGINT;

-- alteração concluida
-- inserção da linha:

INSERT INTO tarefas VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'A');

-- Inserção concluída.

-- 3° Questão

-- corrigindo a penúltima coluna para evitar a inserção. 

ALTER TABLE tarefas ALTER COLUMN prioridade TYPE SMALLINT;

-- Corrigido tipo do valor de inteiro para smallint para não aceitar valores maiores que 32767

-- Não inserção dos seguintes valores:

INSERT INTO tarefas VALUES (2147483649, 'limpar portas da entrada principal', '32322525199', 32768, 'A');

INSERT INTO tarefas VALUES (2147483650, 'limpar janelas da entrada principal', '32322525199', 32769, 'A');

-- Inserindo valores que devem ser possíveis.

INSERT INTO tarefas VALUES (2147483651, 'limpar portas do 1o andar', '32323232911', 32767, 'A');

INSERT INTO tarefas VALUES (2147483652, 'limpar portas do 2o andar', '32323232911', 32766, 'A');

-- 4° QUESTÃO 

-- alteração do nome da 1° coluna 	
ALTER TABLE tarefas RENAME COLUMN id_tarefa TO id;

-- Colocando restrições nas colunas para não receber null (1)

ALTER TABLE tarefas ALTER COLUMN id SET NOT null;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT null;
ALTER TABLE tarefas ALTER COLUMN func_resp_cpf SET NOT null;
ALTER TABLE tarefas ALTER COLUMN prioridade SET NOT null;
ALTER TABLE tarefas ALTER COLUMN status SET NOT null;

-- Alteração para evitar o erro

DELETE FROM tarefas WHERE status is null;

-- repetindo o script do (1)

-- 5° questão

-- Adicionado uma restrição para evitar id's de tarefas, iguais.

ALTER TABLE tarefas ADD CONSTRAINT tarefas_id_pkey PRIMARY KEY (id);

-- inserção deve acontecer:

INSERT INTO tarefas VALUES (2147483653, 'limpar portas do 1o andar', '32323232911', 2, 'A');

-- Iserção não deve acontecer:

INSERT INTO tarefas VALUES (2147483653, 'aparar a grama da área frontal', '32323232911', 3, 'A');

-- 6° Questão

-- Questão 6.A)

ALTER TABLE tarefas ADD CONSTRAINT tarefas_chk_cpf_valido CHECK (LENGTH(func_resp_cpf) = 11);

-- Testando inserção com 10 caracters

INSERT INTO tarefas VALUES (1234567890, 'limpar o banheiro do lcc2', '1234567890', 2, 'A');

-- Testando inserção com 12 caracters

INSERT INTO tarefas VALUES (4567891234, 'limpar banheiro CAA 1o andar', '0000000001001', 5, 'A');

-- QUESTÃO 6.B)
-- Fazendo updates.

UPDATE tarefas SET status = 'P' WHERE status = 'A';
UPDATE tarefas SET status = 'C' WHERE status = 'F';

-- Aplicando restrição.

ALTER TABLE tarefas ADD CONSTRAINT tarefas_chk_status CHECK (status IN ('P','C','E'));

-- 7° QUESTÃO

-- Update para 2 tuplas:

UPDATE tarefas SET prioridade = 32767 WHERE prioridade = 2;
UPDATE tarefas SET prioridade = 32766 WHERE prioridade = 1;

-- Corrigindo update errado:

UPDATE tarefas SET prioridade = 2 WHERE prioridade = 32767;
UPDATE tarefas SET prioridade = 1 WHERE prioridade = 32766;

-- Insert Constraint in column prioridade

ALTER TABLE tarefas ADD CONSTRAINT tarefas_chk_prioridade CHECK (0 <= prioridade AND prioridade <= 5);

-- 8° Questão

CREATE TABLE funcionario(
	cpf VARCHAR(11) PRIMARY KEY,
	data_nasc VARCHAR(20) NOT NULL,
	nome VARCHAR(40) NOT NULL,
	funcao VARCHAR(11) NOT NULL,
	nivel CHAR(1) NOT NULL,
	superior_cpf VARCHAR(11) REFERENCES funcionario (cpf),
	CHECK (nivel IN ('J', 'P', 'S')),
	CHECK (funcao = 'LIMPEZA' AND superior_cpf != null)
);

-- DROPPED/MODIFIED constraint 

ALTER TABLE funcionario DROP CONSTRAINT funcionario_check;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcao_check CHECK ((funcao = 'LIMPEZA' AND superior_cpf != null) OR funcao = 'SUP_LIMPEZA');

-- Insert works on

INSERT INTO funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678911', '1980-05-07', 'Pedro da Silva', 'SUP_LIMPEZA', 'S', null);

INSERT INTO funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678912', '1980-03-08', 'Jose da Silva', 'LIMPEZA', 'J', '12345678911');

-- Didn't insert on

INSERT INTO funcionario (cpf, data_nasc, nome, funcao, nivel, superior_cpf) VALUES ('12345678913', '1980-04-09', 'joao da Silva', 'LIMPEZA', 'J', null);

-- não funcionou :(
-- ...
-- deletar tupla

DELETE FROM funcionario WHERE cpf = '12345678913';

-- modificar a constraint:

ALTER TABLE funcionario DROP CONSTRAINT funcionario_funcao_check;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcao_check CHECK ((funcao = 'LIMPEZA' AND superior_cpf IS NOT null) OR funcao = 'SUP_LIMPEZA');

-- FUNCIONOU!!! :D

-- 9° Questão






