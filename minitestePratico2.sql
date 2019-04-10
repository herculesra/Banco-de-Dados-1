CREATE TABLE usuarios(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(15) NOT NULL,
	data_nascimento DATE NOT NULL
);


CREATE TABLE musicas(
	titulo VARCHAR(20) NOT NULL,
	estilo CHAR(1) NOT NULL,
	CHECK (estilo IN ('R','P','E','S','A','C'))
);

CREATE TABLE avaliacoes(
	nota SMALLINT NOT NULL,
	data_ava DATE,	
	CHECK(0 <= nota AND nota >= 5)
);

CREATE TABLE perfil(
	id_usuario INTEGER NOT NULL UNIQUE REFERENCES usuarios (id),
	descr_perfil TEXT NOT NULL,
	cadastra_usuario BOOLEAN NOT NULL,
	cadastra_musica BOOLEAN NOT NULL,
	faz_avaliacao BOOLEAN NOT NULL
);
