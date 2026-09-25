ALTER TABLE usuarios 
ADD COLUMN IF NOT EXISTS pontos_xp INT DEFAULT 0,
ADD COLUMN IF NOT EXISTS nivel INT DEFAULT 1;

CREATE TABLE IF NOT EXISTS conquistas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT NOT NULL,
    pontos_recompensa INT NOT NULL DEFAULT 50,
    icone_url VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS usuario_conquistas (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    conquista_id INT NOT NULL REFERENCES conquistas(id) ON DELETE CASCADE,
    data_desbloqueio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_usuario_conquista UNIQUE(usuario_id, conquista_id)
);

INSERT INTO conquistas (nome, descricao, pontos_recompensa) VALUES
('Primeiros Passos', 'Concluiu a primeira atividade no projeto.', 50),
('Mestre dos Prazos', 'Concluiu 5 atividades consecutivas antes do prazo.', 150),
('Pilar do Departamento', 'Alocado em mais de 3 projetos ativos.', 200)
ON CONFLICT (nome) DO NOTHING;