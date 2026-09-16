INSERT INTO departamentos (nome, sigla) VALUES
('Tecnologia da Informação', 'TI'),
('Recursos Humanos', 'RH')
ON CONFLICT (nome) DO NOTHING;

INSERT INTO cargos (titulo, salario_base) VALUES
('Desenvolvedor Pleno', 6500.00),
('Gerente de Projetos', 11000.00)
ON CONFLICT (titulo) DO NOTHING;

INSERT INTO usuarios (nome, email, id_departamento, id_cargo) VALUES
('Ana Silva', 'ana.silva@empresa.com', 1, 2),
('Carlos Souza', 'carlos.souza@empresa.com', 1, 1)
ON CONFLICT (email) DO NOTHING;

INSERT INTO permissoes (chave, descricao) VALUES
('PROJECT_CREATE', 'Permite criar projetos'),
('TASK_CLOSE', 'Permite fechar tarefas')
ON CONFLICT (chave) DO NOTHING;

INSERT INTO usuarios_permissoes (id_usuario, id_permissao) VALUES
(1, 1),
(1, 2),
(2, 2)
ON CONFLICT DO NOTHING;

INSERT INTO projetos (nome, descricao, data_inicio, id_gerente) VALUES
('Sistema de Gestão ERP', 'Implementação do novo módulo de projetos', '2026-01-10', 1);

INSERT INTO atividades (titulo, status, id_projeto, id_usuario_responsavel) VALUES
('Mapeamento de Requisitos', 'CONCLUIDO', 1, 1),
('Modelagem do Banco de Dados', 'EM_ANDAMENTO', 1, 2);