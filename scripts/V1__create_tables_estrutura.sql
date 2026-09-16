CREATE TABLE IF NOT EXISTS departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    sigla VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS cargos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    salario_base NUMERIC(10, 2) CHECK (salario_base >= 0)
);

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    id_departamento INT REFERENCES departamentos(id) ON DELETE SET NULL,
    id_cargo INT REFERENCES cargos(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS permissoes (
    id SERIAL PRIMARY KEY,
    chave VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS usuarios_permissoes (
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    id_permissao INT REFERENCES permissoes(id) ON DELETE CASCADE,
    PRIMARY KEY (id_usuario, id_permissao)
);