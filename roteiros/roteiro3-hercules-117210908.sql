CREATE TYPE estados_nordeste AS ENUM ('PB', 'CE', 'RN', 'AL', 'BH', 'PI', 'PE', 'MA', 'SE');

CREATE TABLE farmacias(
	id_farmacia INTEGER CONSTRAINT farmarcias_id_farmacia_pkey PRIMARY KEY,
	farmacia_sede CHAR(1) NOT NULL,	-- QUESTÃO 1, S para SEDE e F para FILIAL
	cidade VARCHAR(20) NOT NULL,
	bairro VARCHAR(50) NOT NULL UNIQUE, -- QUESTÃO 14
	estado estados_nordeste, -- QUESTÃO 19 
	CHECK (farmacia_sede = 'S' OR farmacia_sede = 'F'),
	CONSTRAINT farmacia_sede_excl EXCLUDE USING gist (farmacia_sede WITH =) WHERE (farmacia_sede = 'S') -- QUESTÃO 15
	
);

CREATE TABLE funcionarios(
	nome VARCHAR(20) NOT NULL,
	idade INTEGER 	NOT NULL,
	cpf VARCHAR(11) PRIMARY KEY
);

	
	
