# Sistema de Gerenciamento de Projetos Corporativos

## Contexto e Apresentação do Projeto
- **Tema:** Gerenciamento de Projetos
- **Objetivo Geral:** Desenvolver uma ferramenta corporativa para o controle centralizado de projetos, atividades, usuários, departamentos e permissões de acesso.
- **Público-Alvo:** Gerentes de projetos, diretores de departamentos, administradores de TI e colaboradores de equipes operacionais.

---

## 1. Stakeholders (Interessados)
1. **Gerente de Projetos:** Responsável pelo planejamento, criação de projetos, atribuição de tarefas e acompanhamento do cronograma.
2. **Membros da Equipe / Colaboradores:** Executam as atividades atribuídas, atualizam o progresso e alteram o status das tarefas.
3. **Gerente de Departamento / Diretoria:** Acompanha os projetos vinculados ao seu setor e analisa os relatórios de alocação de recursos.
4. **Administrador do Sistema:** Gerencia a estrutura organizacional (departamentos e cargos), cadastra usuários e concede permissões de acesso.

---

## 2. Principais Problemas do Cenário Atual
1. **Falta de visibilidade e centralização:** Dificuldade em acompanhar o status real e os prazos dos projetos entre diferentes setores da empresa.
2. **Sobreposição de tarefas e desorganização:** Ausência de controle claro sobre a lotação de usuários em departamentos e sobre quem é o responsável por cada atividade.
3. **Insegurança e acessos indevidos:** Falta de um mecanismo de controle de acesso refinado que defina exatamente o que cada usuário pode visualizar ou alterar.
4. **Comunicação descentralizada:** Informações sobre o andamento das atividades espalhadas em canais informais e sem registro histórico.

---

## 3. Requisitos Funcionais (RF)
- **RF01 - Gerenciar Estrutura Organizacional:** O sistema deve permitir cadastrar, consultar, alterar e remover Departamentos, Cargos e Usuários.
- **RF02 - Gerenciar Lotação:** O sistema deve permitir alocar um Usuário a um Departamento e a um Cargo específico.
- **RF03 - Gerenciar Permissões:** O sistema deve permitir atribuir e revogar permissões de acesso aos usuários.
- **RF04 - Gerenciar Projetos:** O sistema deve permitir a criação, edição, finalização e cancelamento de Projetos vinculados a um departamento.
- **RF05 - Gerenciar Atividades:** O sistema deve permitir o registro de Atividades associadas a um projeto, definindo prazo e usuário responsável.
- **RF06 - Atualizar Status de Atividade:** O sistema deve permitir que o responsável altere o status de uma atividade (ex: *Pendente*, *Em Andamento*, *Concluída*).
- **RF07 - Consultar Projetos e Atividades:** O sistema deve permitir filtrar e buscar projetos por departamento, status ou responsável.

---

## 4. Requisitos Não Funcionais (RNF)
- **RNF01 - Segurança e Autenticação:** O sistema deve garantir a criptografia de senhas no banco de dados e autenticação segura de usuários.
- **RNF02 - Desempenho:** As consultas e listagens de projetos e atividades devem responder em menos de 2 segundos sob uso normal.
- **RNF03 - Usabilidade:** A interface deve ser responsiva e intuitiva para facilitar a navegação em dispositivos desktop e móveis.
- **RNF04 - Integridade de Dados:** O sistema deve aplicar restrições de chave estrangeira no PostgreSQL para impedir a exclusão acidental de dados vinculados (ex: departamentos com usuários alocados).

---

## 5. Casos de Uso Detalhados

### UC01 - Cadastrar Projeto
- **Ator Principal:** Gerente de Projetos.
- **Pré-condição:** Estar autenticado no sistema e possuir a permissão `CRIAR_PROJETO`.
- **Fluxo Principal:**
  1. O Gerente acessa o menu de "Projetos" e seleciona "Novo Projeto".
  2. O sistema exibe o formulário de cadastro (Nome, Descrição, Data de Início, Data de Término Prevista, Departamento Responsável).
  3. O Gerente preenche as informações e confirma o cadastro.
  4. O sistema valida os dados e grava o registro na tabela `projetos` com o status inicial *Em Planejamento*.
  5. O sistema exibe uma mensagem de confirmação de sucesso.
- **Fluxos Alternativos / Exceções:**
  - *Campos obrigatórios não preenchidos:* O sistema destaca os campos faltantes e impede o envio.
  - *Data final inválida:* Se a data de término prevista for anterior à data de início, o sistema exibe uma mensagem de erro e solicita a correção.

### UC02 - Atribuir Permissão ao Usuário
- **Ator Principal:** Administrador do Sistema.
- **Pré-condição:** Administrador estar autenticado no sistema.
- **Fluxo Principal:**
  1. O Administrador acessa a tela de "Gestão de Usuários e Permissões".
  2. O Administrador seleciona o usuário desejado na listagem.
  3. O sistema carrega as permissões atuais atribuídas àquele usuário.
  4. O Administrador marca ou desmarca as permissões desejadas.
  5. O Administrador confirma as alterações.
  6. O sistema atualiza os registros na tabela associativa `usuario_permissoes` e registra a alteração.
  7. O sistema exibe a confirmação de atualização de privilégios.
- **Fluxo Alternativo / Exceção:**
  - *Usuário inativo:* Se o usuário selecionado estiver inativo, o sistema exibe um alerta e impede a atribuição de novas permissões.

---

## 6. Modelagem e Diagramas

### Diagrama de Casos de Uso
![Diagrama de Casos de Uso](docs/diagrama_casos_uso.png)

### Diagrama de Classes UML
![Diagrama de Classes](docs/diagrama_classes.png)

---

## 7. Scripts de Banco de Dados (PostgreSQL)
Os scripts SQL DDL e DML criados para a estrutura do banco de dados estão organizados na pasta `/scripts`:
- `V1__create_table_estrutura_organizacional.sql`
- `V2__create_table_projetos_e_atividades.sql`
- `V3__create_table_permissoes.sql`
- `V4__insert_into_dados_iniciais.sql`
