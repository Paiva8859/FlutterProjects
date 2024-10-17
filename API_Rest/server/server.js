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
