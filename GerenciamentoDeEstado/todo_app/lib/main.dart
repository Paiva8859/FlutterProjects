// main.dart

import 'package:flutter/material.dart'; // Importa a biblioteca Flutter para construir a UI.
import 'package:provider/provider.dart'; // Importa a biblioteca Provider para gerenciamento de estado.
import 'package:todo_app/providers/task_screen.dart';
import 'providers/task_provider.dart'; // Importa o TaskProvider para gerenciamento da lista de tarefas.
import 'task_screen.dart'; // Importa a tela de tarefas.

void main() {
  // Função principal que inicia o aplicativo.
  runApp(
    ChangeNotifierProvider(
      // Cria um provedor que notifica os ouvintes sobre alterações no estado.
      create: (context) => TaskProvider(), // Instancia o TaskProvider.
      child: MyApp(), // O widget MyApp é passado como filho do provedor.
    ),
  );
}

// Classe principal do aplicativo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Método que constrói a interface do usuário.
    return MaterialApp(
      title: 'To-Do List', // Título do aplicativo.
      home: TaskScreen(), // Define a tela inicial como TaskScreen.
    );
  }
}
