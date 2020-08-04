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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OneRow(),
          Container(
              padding: EdgeInsets.all(20),
              color: Colors.cyan,
              child: Text("One")),
          Container(
              padding: EdgeInsets.all(30),
              color: Colors.greenAccent,
              child: Text("Two")),
          Container(
              padding: EdgeInsets.all(40),
              color: Colors.orangeAccent,
              child: Text("Three"))
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Text("Click"), onPressed: () => null),
    );
  }
}

class OneRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello, whoever is looking at this."),
        FlatButton(
            onPressed: () => null, color: Colors.amber, child: Text("Click")),
        Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30),
            child: Text("Inside"))
      ],
    );
  }
}
