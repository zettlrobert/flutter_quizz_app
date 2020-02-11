import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// could use arrow function here
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
  final _questions = const [
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

    if (_questionIndex < _questions.length) {
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
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    ); // Material App
  }
}
