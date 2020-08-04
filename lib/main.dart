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
      body: Center(child: Image.asset("assets/lake.jpg")),
      floatingActionButton:
          FloatingActionButton(child: Text("Click"), onPressed: () => null),
    );
  }
}
