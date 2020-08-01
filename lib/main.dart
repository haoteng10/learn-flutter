// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("Learn Flutter"),
      centerTitle: true,
      backgroundColor: Colors.orange[600],
    ),
    body: Center(
      child: Text(
        "Text is right here!",
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[600],
            fontFamily: "IndieFlower"),
      ),
    ),
    floatingActionButton:
        FloatingActionButton(child: Text("Click"), onPressed: () => null),
  )));
}
