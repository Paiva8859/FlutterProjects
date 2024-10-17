# Tutorial: Widgets no Flutter e Construção de Interface de Usuário

Este tutorial aborda os principais widgets no Flutter e a construção de interfaces utilizando **StatefulWidget**, **StatelessWidget**, layouts com **Row**, **Column**, **Stack**, navegação entre páginas com **Navigator**, além da criação de **Formulários e Validação**.

## 1. StatefulWidget e StatelessWidget

Flutter possui dois tipos principais de widgets: **StatefulWidget** e **StatelessWidget**.

- **StatelessWidget**: Não mantém estado interno.
- **StatefulWidget**: Mantém e modifica o estado interno dinamicamente.

### Exemplo de StatelessWidget:

```dart
import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Center(
        child: Text('Eu sou imutável!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyStatelessWidget()));
}

```
### Exemplo de StatefulWidget:
```dart
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Você clicou $_counter vezes:'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyStatefulWidget()));
}

```
## 2. Layouts (Row, Column, Stack)

Flutter utiliza widgets como **Row**, **Column** e **Stack** para criar layouts flexíveis.

- **Row**: Organiza widgets horizontalmente.
- **Column**: Organiza widgets verticalmente.
- **Stack**: Sobrepõe widgets.

### Exemplo com Row e Column:

```dart
import 'package:flutter/material.dart';

class LayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layouts com Row e Column'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Elemento 1'),
              Text('Elemento 2'),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text('Elemento A'),
              Text('Elemento B'),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: LayoutExample()));
}

```

### Exemplo com Stack:
```dart
import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout com Stack'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 200,
            width: 200,
          ),
          Positioned(
            left: 50,
            top: 50,
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: StackExample()));
}
```

## 3. Navegação entre Páginas (Navigator)

A navegação entre páginas no Flutter é feita usando o widget **Navigator**, que gerencia um histórico de rotas. O método mais comum para navegar entre páginas é usando **Navigator.push** e **Navigator.pop**.

### Exemplo de Navegação entre Páginas:

Neste exemplo, vamos criar duas páginas simples. A primeira página terá um botão que, quando pressionado, navegará para a segunda página. Na segunda página, haverá um botão para voltar à primeira página.

### Código:

```dart
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Página'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir para a Segunda Página'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Voltar para a Primeira Página'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FirstPage()));
}
```
## 4. Formulários e Validação

No Flutter, os formulários são criados usando o widget **Form**, que permite coletar e validar entradas dos usuários. Com o widget **TextFormField**, você pode criar campos de texto e utilizar validadores para garantir que os dados inseridos sejam válidos.

### Exemplo de Formulário com Validação:

Neste exemplo, vamos criar um formulário simples com dois campos de texto: nome e e-mail. O formulário fará a validação para garantir que o nome não esteja vazio e que o e-mail seja válido.

### Código:

```dart
import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário com Validação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o seu e-mail';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processando os dados...')),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyFormPage()));
}
```