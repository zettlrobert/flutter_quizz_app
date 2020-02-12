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
      'answers': [
        {'text': 'teal', 'score': 10},
        {'text': 'orange', 'score': 20},
        {'text': 'black', 'score': 30},
        {'text': 'magenta', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dragon', 'score': 10},
        {'text': 'Quirin', 'score': 20},
        {'text': 'Eagle', 'score': 30},
      ],
    },
    {
      'questionText': 'What\'s your favourite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 30},
        {'text': 'Brad', 'score': 20},
        {'text': 'Andrew', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

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
            : Result(_totalScore, _resetQuiz),
      ),
    ); // Material App
  }
}
