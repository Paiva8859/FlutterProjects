// providers/task_provider.dart

import 'package:flutter/foundation.dart'; // Importa a biblioteca para usar ChangeNotifier
import '../models/task.dart'; // Importa o modelo Task

// Classe TaskProvider que gerencia o estado da lista de tarefas.
class TaskProvider with ChangeNotifier {
  // Lista privada que armazena as tarefas.
  List<Task> _tasks = [];

  // Getter que permite acessar a lista de tarefas.
  List<Task> get tasks => _tasks;

  // Método para adicionar uma nova tarefa à lista.
  void addTask(String title) {
    // Adiciona uma nova tarefa à lista com o título fornecido.
    _tasks.add(Task(title: title));
    // Notifica todos os ouvintes que o estado foi alterado.
    notifyListeners();
  }

  // Método para alternar o status de conclusão de uma tarefa.
  void toggleTaskStatus(int index) {
    // Inverte o estado de conclusão da tarefa na posição 'index'.
    _tasks[index].isDone = !_tasks[index].isDone;
    // Notifica os ouvintes sobre a mudança.
    notifyListeners();
  }

  // Método para remover uma tarefa da lista.
  void removeTask(int index) {
    // Remove a tarefa na posição 'index' da lista.
    _tasks.removeAt(index);
    // Notifica os ouvintes que o estado foi alterado.
    notifyListeners();
  }
}
