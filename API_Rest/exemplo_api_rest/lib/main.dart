import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importa o pacote http para fazer requisições
import 'dart:convert'; // Importa o pacote para trabalhar com JSON

void main() {
  runApp(MyApp()); // Inicia a aplicação Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Integration Example', // Título da aplicação
      theme: ThemeData(primarySwatch: Colors.blue), // Tema da aplicação
      home: UserListScreen(), // Tela inicial da aplicação
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<dynamic> users = []; // Lista para armazenar usuários

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Chama a função para buscar os usuários ao iniciar
  }

  // Função para buscar usuários da API (GET)
  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/users')); // URL corrigida

    // Verifica se a requisição foi bem-sucedida
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body); // Atualiza a lista de usuários
      });
    } else {
      throw Exception('Failed to load users'); // Lança exceção se falhar
    }
  }

  // Função para adicionar um novo usuário (POST)
  Future<void> addUser(String name, String email) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/users'), // URL corrigida
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8', // Define o tipo de conteúdo
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
      }),
    );

    // Verifica se a requisição foi bem-sucedida
    if (response.statusCode == 201) {
      fetchUsers(); // Atualiza a lista de usuários após adicionar
    } else {
      throw Exception('Failed to add user'); // Lança exceção se falhar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')), // Título da barra de app
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length, // Número de usuários na lista
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']), // Nome do usuário
                  subtitle: Text(users[index]['email']), // Email do usuário
                );
              },
            ),
          ),
          UserInputForm(onAddUser: addUser), // Formulário para adicionar usuário
        ],
      ),
    );
  }
}

// Widget para entrada de dados do usuário
class UserInputForm extends StatelessWidget {
  final Function(String, String) onAddUser; // Função a ser chamada ao adicionar usuário
  final TextEditingController nameController = TextEditingController(); // Controlador para o campo de nome
  final TextEditingController emailController = TextEditingController(); // Controlador para o campo de email

  UserInputForm({required this.onAddUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: nameController, // Controlador para o campo de nome
              decoration: InputDecoration(labelText: 'Name'), // Rótulo do campo
            ),
          ),
          Expanded(
            child: TextField(
              controller: emailController, // Controlador para o campo de email
              decoration: InputDecoration(labelText: 'Email'), // Rótulo do campo
            ),
          ),
          IconButton(
            icon: Icon(Icons.add), // Ícone para adicionar
            onPressed: () {
              onAddUser(nameController.text, emailController.text); // Chama a função para adicionar usuário
              nameController.clear(); // Limpa o campo de nome após adicionar
              emailController.clear(); // Limpa o campo de email após adicionar
            },
          ),
        ],
      ),
    );
  }
}
