# Sistema de Gerenciamento de Projetos Corporativos

## Apresentação do Projeto
* **Tema:** Gerenciamento de Projetos
* **Objetivo Geral:** Prover uma ferramenta relacional centralizada...
* **Público-Alvo:** Gestores de projetos, líderes de departamento...

## Modelo de Dados Relacional (ERD)

```mermaid
erDiagram
DEPARTAMENTOS ||--o{ USUARIOS : lota
    CARGOS ||--o{ USUARIOS : possui
    USUARIOS ||--o{ PROJETOS : gerencia
    PROJETOS ||--o{ ATIVIDADES : contem
    USUARIOS ||--o{ ATIVIDADES : responsavel
    USUARIOS ||--o{ USUARIOS_PERMISSOES : possui
    PERMISSOES ||--o{ USUARIOS_PERMISSOES : concede

    DEPARTAMENTOS {
        int id PK
        string nome
        string sigla
    }