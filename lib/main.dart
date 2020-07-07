import 'package:flutter/material.dart';

import './quiz.dart';
import './wyniki.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'inveted the flutter ?',
      'answers': [
        {'text': 'Google', 'score': 1},
        {'text': 'Microsoft', 'score': 0},
        {'text': 'Sony', 'score': 0},
        {'text': 'Amazon', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s  programming language is use in flutter ?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Scala', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'Kotlin', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s phone system can use flutter?',
      'answers': [
        {'text': 'iOS', 'score': 0},
        {'text': 'Android', 'score': 0},
        {'text': 'Fuchsia', 'score': 0},
        {'text': 'iOS and Android', 'score': 1},
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
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
