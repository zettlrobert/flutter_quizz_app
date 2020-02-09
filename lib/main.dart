import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuizzAppState();
  }
}

class _QuizzAppState extends State<QuizzApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['teal', 'orange', 'black', 'magenta'],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': ['Dragon', 'Quirin', 'Eagle'],
      },
      {
        'questionText': 'What\'s your favourite Instructor?',
        'answers': ['Max', 'Brad', 'Andrew'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ), // AppBar
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ), // Column
      ), // Scaffold
    ); // Material App
  }
}
