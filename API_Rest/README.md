# exemplo_api_rest
## Servidor Node.js X Flutter

## 1. Configuração do servidor js
1. Instale o Node, se ainda não o tiver.
2. Crie um diretório na pasta raíz. Exemplo de caminho: ```pasta_raíz\server```.
3. Instale o express na pasta ```server```. ```npm install express```.
4. Crie um arquivo ```server.js``` e adicione o seguinte código:
            const express = require('express'); // Importa o módulo express
            const app = express(); // Cria uma instância da aplicação Express
            const port = 3000; // Define a porta em que o servidor irá escutar

            app.use(express.json()); // Middleware para interpretar requisições com corpo em JSON

            // Dados de exemplo - uma lista de usuários
            const users = [
                { id: 1, name: 'Alice', email: 'alice@example.com' },
                { id: 2, name: 'Bob', email: 'bob@example.com' },
            ];

            // Endpoint GET para obter a lista de usuários
            app.get('/users', (req, res) => {
                res.json(users); // Responde com a lista de usuários em formato JSON
            });

            // Endpoint POST para adicionar um novo usuário
            app.post('/users', (req, res) => {
                // Cria um novo usuário com um ID único, nome e email obtidos do corpo da requisição
                const newUser = {
                    id: users.length + 1, // Gera um novo ID baseado no comprimento atual da lista
                    name: req.body.name, // Obtém o nome do corpo da requisição
                    email: req.body.email, // Obtém o email do corpo da requisição
                };

                users.push(newUser); // Adiciona o novo usuário à lista
                res.status(201).json(newUser); // Responde com o novo usuário e um status 201 (Criado)
            });

            // Inicia o servidor e faz com que ele escute na porta especificada
            app.listen(port, () => {
                console.log(`Server running at http://localhost:${port}`); // Mensagem de confirmação no console
            });


5. Inicie o servidor com o comando ```node .\server.js```. Agora a API estará rodando em ```http://localhost:3000/users```.


## 2. Configuração do projeto
1. Crie um novo projeto Flutter. Exemplo de caminho: ```pasta_raíz\projeto_api_rest```
2. Abra um terminal na pasta de seu projeto e execute o seguinte código: ```flutter pub add http```, assim fazendo o download automático da dependência http. Após isso, execute o comando ```flutter pub get```, assim instalando todas as dependências listadas no arquivo ```pubspec.yaml```

## 3. Estrutura básica do projeto
1. Substitua o conteúdo do arquivo ```lib/main.dart``` pelo seguinte conteúdo:
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

2. Explicação detalhada:
`main()`
> **Descrição**: Função principal que inicia a aplicação Flutter.
>
> **Responsabilidade**: Chama `runApp()` passando `MyApp`, que é o widget raiz da aplicação.

`MyApp`
> **Descrição**: Classe que define o widget da aplicação.
> 
> **Responsabilidade**: Configura o tema e a tela inicial da aplicação.

`UserListScreen`
> **Descrição**: Classe que representa a tela principal onde a lista de usuários é exibida.
>
> **Responsabilidade**: Inicializa a lista de usuários. Chama a função `fetchUsers()` ao iniciar para obter os dados do servidor.

`fetchUsers()`
> **Descrição**: Função assíncrona que realiza uma requisição GET para obter a lista de usuários da API.
>
> **Responsabilidade**: Faz uma requisição para `http://localhost:3000/users`. Se a requisição for bem-sucedida (código 200), decodifica a resposta JSON e atualiza a lista de usuários.

`addUser(String name, String email)`
> **Descrição**: Função assíncrona que realiza uma requisição POST para adicionar um novo usuário.
>
> **Responsabilidade**: Envia o nome e o email do novo usuário para `http://localhost:3000/users`. Se a requisição for bem-sucedida (código 201), chama `fetchUsers()` para atualizar a lista de usuários.

`UserInputForm`
> **Descrição**: Widget que contém campos de texto para entrada de dados do usuário.
>
> **Responsabilidade**: Permite que o usuário insira um nome e um email. Chama `onAddUser()` ao pressionar o botão de adicionar, passando os dados dos campos.