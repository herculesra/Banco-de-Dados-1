CREATE TABLE Estudante(
    matricula INTEGER PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE NOT NULL
);

CREATE TABLE Disciplina(
    codigo SMALLINT PRIMARY KEY,
    carga_horaria SMALLINT NOT NULL,
    CHECK (carga_horaria > 0)
);

CREATE TABLE EstudanteDisciplina(
    matricula INTEGER REFERENCES Estudante (matricula),
    disciplina SMALLINT REFERENCES Disciplina (codigo),
    periodo_letivo INTEGER NOT NULL,
    CHECK (periodo_letivo > 0)
);

