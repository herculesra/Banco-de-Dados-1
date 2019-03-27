CREATE TABLE automovel(
	dono_automovel VARCHAR(20), 
	placa VARCHAR(7), 
	vin VARCHAR(14), 
	marca VARCHAR(10), 
	modelo VARCHAR(10)
);

CREATE TABLE oficina(
	nome VARCHAR(20),
	cnpj VARCHAR(14),
	endereco TEXT
);

CREATE TABLE reparo(
	cnpj_oficina VARCHAR(14),
	descricao TEXT,
	valor NUMERIC
);

CREATE TABLE pericia(
	descricao TEXT,
	nome_perito VARCHAR(20),
	cpf_perito VARCHAR(20)
);

CREATE TABLE sinistro(
	data TIMESTAMP,
	ocorrencia TEXT,
	nome_cliente VARCHAR(20),
	cpf_cliente VARCHAR(20)
);

CREATE TABLE perito(
	nome VARCHAR(20),
	cpf VARCHAR(20),
	data_nascimento DATE,
	admissao DATE,
	salario NUMERIC
);

CREATE TABLE seguro(
	tipo VARCHAR(20),
	valor NUMERIC
);

CREATE TABLE segurado(
	nome VARCHAR(20),
	cpf VARCHAR(20),
	idade INTEGER,
	escolaridade VARCHAR(20),
	endereco VARCHAR(50),
	quantidade_ocorrencias INTEGER
);

-- 3° questão
-- inserções de novos atributos.
-- declaração das pkeys.

ALTER TABLE automovel ADD CONSTRAINT vin_pkey PRIMARY KEY (vin);
ALTER TABLE oficina ADD CONSTRAINT cnpj_pkey PRIMARY KEY (cnpj);
ALTER TABLE reparo ADD COLUMN id_reparo INTEGER CONSTRAINT id_reparo_pkey PRIMARY KEY;
ALTER TABLE pericia ADD COLUMN id_pericia INTEGER CONSTRAINT id_pericia_pkey PRIMARY KEY;
ALTER TABLE sinistro ADD CONSTRAINT data_pkey PRIMARY KEY (data);
ALTER TABLE perito ADD CONSTRAINT cpf_pkey PRIMARY KEY (cpf);
ALTER TABLE seguro ADD CONSTRAINT tipo_valor_pkey PRIMARY KEY (tipo, valor);
ALTER TABLE segurado ADD CONSTRAINT segurado_cpf_pkey PRIMARY KEY (cpf);

-- 4° questão
-- Insersão de chaves estrangeiras para referenciar e relacionar tabelas.
-- Exclusão do atributo "dono_automovel".
-- Novo atributo para referenciar a tabela automovel com o segurado.

ALTER TABLE pericia ADD CONSTRAINT pericia_cpf_perito_fkey FOREIGN KEY (cpf_perito) REFERENCES perito (cpf);
ALTER TABLE reparo ADD CONSTRAINT reparo_cnpj_ofina_fkey FOREIGN KEY (cnpj_oficina) REFERENCES oficina (cnpj);
ALTER TABLE automovel DROP COLUMN dono_automovel;
ALTER TABLE automovel ADD COLUMN cpf_dono VARCHAR(20) REFERENCES segurado (cpf);

-- 5° Questão
-- inserção do novo atributo na tabela seguro
-- Modificando a integridade de alguns atributos.


ALTER TABLE seguro ADD COLUMN numero_seguro INTEGER NOT NULL;
ALTER TABLE automovel ALTER COLUMN cpf_dono SET NOT NULL;
ALTER TABLE automovel ALTER COLUMN placa SET NOT NULL;
ALTER TABLE automovel ALTER COLUMN marca SET NOT NULL;
ALTER TABLE automovel ALTER COLUMN modelo SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN nome SET NOT NULL;
ALTER TABLE oficina ALTER COLUMN endereco SET NOT NULL;
ALTER TABLE reparo ALTER COLUMN valor SET NOT NULL;
ALTER TABLE reparo ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE pericia ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE pericia ALTER COLUMN nome_perito SET NOT NULL;
ALTER TABLE sinistro ALTER COLUMN cpf_cliente SET NOT NULL;
ALTER TABLE sinistro ALTER COLUMN nome_cliente SET NOT NULL;
ALTER TABLE sinistro ALTER COLUMN ocorrencia SET NOT NULL;
ALTER TABLE perito ALTER COLUMN nome SET NOT NULL;
ALTER TABLE perito ALTER COLUMN data_nascimento SET NOT NULL;
ALTER TABLE perito ALTER COLUMN admissao SET NOT NULL;
ALTER TABLE perito ALTER COLUMN salario SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN nome SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN idade SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN quantidade_ocorrencias SET NOT NULL;
ALTER TABLE segurado ALTER COLUMN endereco SET NOT NULL;


-- 6° Questão
-- Remoção das tabelas

DROP TABLE automovel;
DROP TABLE reparo;
DROP TABLE oficina;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE seguro;
DROP TABLE segurado;
DROP TABLE sinistro;

-- 7° Questão

CREATE TABLE automovel(
	cpf_dono VARCHAR(20) NOT NULL, 
	placa VARCHAR(7) NOT NULL, 
	vin VARCHAR(14), 
	marca VARCHAR(10) NOT NULL, 
	modelo VARCHAR(10) NOT NULL,
	CONSTRAINT automovel_vin_pkey PRIMARY KEY (vin),
	CONSTRAINT automovel_cpf_dono_fkey FOREIGN KEY (cpf_dono) REFERENCES segurado (cpf)
);

CREATE TABLE oficina(
	nome VARCHAR(20) NOT NULL,
	cnpj VARCHAR(14),
	endereco TEXT NOT NULL,
	CONSTRAINT oficina_cnpj PRIMARY KEY (cnpj)
);

CREATE TABLE reparo(
	cnpj_oficina VARCHAR(14),
	descricao TEXT,
	valor NUMERIC,
	id_reparo INTEGER,
	CONSTRAINT reparo_id_reparo_pkey PRIMARY KEY (id_reparo),
	CONSTRAINT reparo_cnpj_oficina_fkey FOREIGN KEY (cnpj_oficina) REFERENCES oficina (cnpj)
);


CREATE TABLE pericia(
	descricao TEXT NOT NULL,
	nome_perito VARCHAR(20) NOT NULL,
	cpf_perito VARCHAR(20) NOT NULL,
	id_pericia INTEGER,
	CONSTRAINT pericia_id_pericia_pkey PRIMARY KEY (id_pericia),
	CONSTRAINT pericia_cpf_perito_fkey FOREIGN KEY (cpf_perito) REFERENCES perito (cpf)
);

CREATE TABLE sinistro(
	data TIMESTAMP,
	ocorrencia TEXT NOT NULL,
	nome_cliente VARCHAR(20) NOT NULL,
	cpf_cliente VARCHAR(20) NOT NULL,
	CONSTRAINT data_pkey PRIMARY KEY (data),
	CONSTRAINT sinistro_cpf_cliente_fkey FOREIGN KEY (cpf_cliente) REFERENCES segurado (cpf)
);

CREATE TABLE perito(
	nome VARCHAR(20) NOT NULL,
	cpf VARCHAR(20),
	data_nascimento DATE NOT NULL,
	admissao DATE NOT NULL,
	salario NUMERIC NOT NULL,
	CONSTRAINT perito_cpf_pkey PRIMARY KEY (cpf)
);

CREATE TABLE seguro(
	tipo VARCHAR(20) NOT NULL,
	valor NUMERIC NOT NULL,
	numero_seguro INTEGER,
	CONSTRAINT seguro_numero_seguro_pkey PRIMARY KEY (numero_seguro)
);

CREATE TABLE segurado(
	nome VARCHAR(20) NOT NULL,
	cpf VARCHAR(20),
	idade INTEGER NOT NULL,
	escolaridade VARCHAR(20),
	endereco VARCHAR(50) NOT NULL,
	quantidade_ocorrencias INTEGER NOT NULL,
	CONSTRAINT segurado_cpf_pkey PRIMARY KEY (cpf)
);

-- 8° QUESTÃO
-- ORDEM DE INSERÇÃO:
-- 1° oficina;
-- 1° perito;
-- 1° seguro;
-- 1° segurado;
-- 2° automovel;
-- 2° reparo;
-- 2° pericia;
-- 2° sinistro.

-- 9° QUESTÃO 

DROP TABLE automovel;
DROP TABLE pericia;
DROP TABLE sinistro CASCADE;
DROP TABLE reparo CASCADE;
DROP TABLE oficina;
DROP TABLE perito;
DROP TABLE seguro;
DROP TABLE segurado;



