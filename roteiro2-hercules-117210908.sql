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



