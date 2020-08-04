// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Flutter"),
        centerTitle: true,
        backgroundColor: Colors.orange[600],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 40.0, 80.0),
          margin: EdgeInsets.all(50.0),
          color: Colors.grey[400],
          child: Text("Hello")),
      floatingActionButton:
          FloatingActionButton(child: Text("Click"), onPressed: () => null),
    );
  }
}
