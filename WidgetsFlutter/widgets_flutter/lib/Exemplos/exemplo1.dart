import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Center(
        child: Text('Eu sou inevitável!'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MyStatelessWidget()));
}