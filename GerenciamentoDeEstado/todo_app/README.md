# Roteiro de Desenvolvimento da Aplicação To-Do List

## 1. Definição do Projeto
- **Objetivo**: Criar uma aplicação de lista de tarefas simples usando Flutter e gerenciamento de estado com Provider.
- **Funcionalidades**:
  - Adicionar tarefas
  - Marcar tarefas como concluídas
  - Remover tarefas
  - Persistir dados (opcional para futuras versões)
  - Organizar tarefas por prioridade (opcional)
  - Permitir edição de tarefas (opcional)
  - Filtrar tarefas (por concluídas e não concluídas) (opcional)

## 2. Configuração do Ambiente
- **Instalação do Flutter SDK**:
  - Acesse [flutter.dev](https://flutter.dev/docs/get-started/install) e siga as instruções para seu sistema operacional.
- **Configuração do Editor**:
  - **VS Code**:
    - Instale a extensão Flutter e Dart.
  - **Android Studio**:
    - Instale o plugin Flutter e Dart.
- **Criar um novo projeto Flutter**:
  ```bash
  flutter create todo_app
  cd todo_app
