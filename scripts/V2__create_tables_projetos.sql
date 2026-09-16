CREATE TABLE IF NOT EXISTS projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    id_gerente INT REFERENCES usuarios(id) ON DELETE SET NULL,
    CONSTRAINT chk_datas CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);

CREATE TABLE IF NOT EXISTS atividades (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    status VARCHAR(30) DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE', 'EM_ANDAMENTO', 'CONCLUIDO')),
    id_projeto INT NOT NULL REFERENCES projetos(id) ON DELETE CASCADE,
    id_usuario_responsavel INT REFERENCES usuarios(id) ON DELETE SET NULL
);