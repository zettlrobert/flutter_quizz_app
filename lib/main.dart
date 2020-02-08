import 'package:flutter/material.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ), // AppBar
        body: Column(
          children: <Widget>[
            Text('The question!'),
            RaisedButton(child: Text('Answer 1'), onPressed: null,),
            RaisedButton(child: Text('Answer 2'), onPressed: null,),
            RaisedButton(child: Text('Answer 3'), onPressed: null,),
          ],
        ), // Column
      ), // Scaffold
    ); // Material App
  }
}
