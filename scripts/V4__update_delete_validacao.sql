UPDATE atividades 
SET status = 'CONCLUIDO' 
WHERE id = 2;

UPDATE usuarios 
SET id_departamento = 2 
WHERE email = 'carlos.souza@empresa.com';

DELETE FROM usuarios_permissoes 
WHERE id_usuario = 2 AND id_permissao = 2;