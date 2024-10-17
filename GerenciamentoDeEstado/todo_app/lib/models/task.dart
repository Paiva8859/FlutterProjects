// models/task.dart

// Classe que representa uma tarefa no aplicativo de lista de tarefas.
class Task {
  // A propriedade 'title' armazena o título da tarefa.
  String title;
  
  // A propriedade 'isDone' indica se a tarefa foi concluída ou não.
  // Por padrão, uma nova tarefa é considerada não concluída (false).
  bool isDone;

  // Construtor da classe 'Task'.
  // O título é obrigatório (required), enquanto o estado de conclusão
  // pode ser especificado, mas o padrão é false se não for fornecido.
  Task({required this.title, this.isDone = false});
}
