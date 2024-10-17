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