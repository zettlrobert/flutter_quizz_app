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
  final questions = const [
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

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ), // AppBar
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ), // Column
      ), // Scaffold
    ); // Material App
  }
}
