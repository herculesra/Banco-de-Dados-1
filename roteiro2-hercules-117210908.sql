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

ALTER TABLE tarefas ADD CONSTRAINT tarefas_chk_status CHECK (status IN ('P','C','E'));

-- restrição terminada.

-- QUESTÃO 7


