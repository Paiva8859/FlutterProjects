// task_screen.dart

import 'package:flutter/material.dart'; // Importa a biblioteca Flutter para construir a UI.
import 'package:provider/provider.dart'; // Importa a biblioteca Provider para gerenciamento de estado.
import 'package:todo_app/providers/task_provider.dart'; // Importa o TaskProvider para acessar a lista de tarefas.

class TaskScreen extends StatelessWidget {
  // Controlador de texto para o campo de entrada de nova tarefa.
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtém a instância do TaskProvider para acessar a lista de tarefas.
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'), // Título da barra de aplicativo.
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length, // Número de tarefas a serem exibidas.
              itemBuilder: (context, index) {
                final task = taskProvider.tasks[index]; // Obtém a tarefa na posição 'index'.
                return ListTile(
                  title: Text(
                    task.title, // Exibe o título da tarefa.
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough // Risca o texto se a tarefa estiver concluída.
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete), // Ícone para excluir a tarefa.
                    onPressed: () {
                      taskProvider.removeTask(index); // Remove a tarefa ao pressionar o ícone.
                    },
                  ),
                  onTap: () {
                    taskProvider.toggleTaskStatus(index); // Alterna o status da tarefa ao tocar nela.
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Adiciona espaçamento ao redor do campo de entrada.
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller, // Controlador para o campo de entrada.
                    decoration: InputDecoration(
                      hintText: 'Adicione uma nova tarefa', // Texto de dica no campo de entrada.
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add), // Ícone para adicionar a nova tarefa.
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      taskProvider.addTask(_controller.text); // Adiciona a nova tarefa se o texto não estiver vazio.
                      _controller.clear(); // Limpa o campo de entrada após adicionar.
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
