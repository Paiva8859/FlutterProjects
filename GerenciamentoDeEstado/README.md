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

## 2. Preparação do Ambiente
1. **Pré-requisitos**:
   - Certifique-se de que você possui as seguintes ferramentas instaladas:
     - Flutter SDK
     - Visual Studio Code
     - Bluestacks 5
   - Se precisar de auxílio, consulte tutoriais anteriores disponíveis.

## 3. Iniciando o Projeto Flutter
1. **Criar um Novo Projeto**:
   - Abra o Visual Studio Code.
   - Pressione `Ctrl + Shift + P` e selecione **Flutter: New Project**.
   - Escolha a opção **Application**.
   - Selecione a pasta onde deseja criar a aplicação.

2. **Usando o Terminal**:
   - No terminal integrado, execute o comando:
     ```bash
     flutter create todo_app
     ```
   - Navegue até a pasta do projeto:
     ```bash
     cd todo_app
     ```

## 4. Estrutura do Projeto
1. **Gerenciar Dependências**:
   - Abra o arquivo `pubspec.yaml` e adicione as dependências necessárias para o projeto.

2. **Criar Estruturas de Pastas**:
   - Dentro da pasta `lib`, crie as pastas `models` e `providers`.

3. **Criar Modelos**:
   - Na pasta `models`, crie o arquivo `task.dart` responsável pela definição da classe `Task`.

4. **Criar Providers**:
   - Na pasta `providers`, crie o arquivo `task_provider.dart` que gerencia o estado da lista de tarefas utilizando o `ChangeNotifier`.
   - Crie também o arquivo `task_screen.dart`, que é responsável pela interface do usuário para gerenciar as tarefas.

## 5. Desenvolvendo a Aplicação
1. **Arquivo Main**:
   - Crie o arquivo `main.dart` na pasta `lib`, que inicializa e configura o aplicativo Flutter, além de definir a estrutura básica de gerenciamento de estado.

## 6. Executando a Aplicação
1. **Abrindo a Aplicação no Bluestacks**:
   - Para rodar a aplicação no Bluestacks 5, siga os passos abaixo:
     - Certifique-se de que o Bluestacks está configurado corretamente.
     - No Visual Studio Code, selecione "No Device". Se aparecer algum servidor além do Chrome ou Edge, isso é normal.
     - Abra o Bluestacks 5, vá em **Configurações** > **Dados do Usuário** > **Liberar Espaço**. Após isso, você conseguirá abrir a aplicação.

## 7. Considerações Finais
- Após seguir todos os passos, sua aplicação de lista de tarefas deve estar funcionando corretamente. Continue aprimorando-a com as funcionalidades opcionais mencionadas.
