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