import 'package:flutter/material.dart';
import './Quiz.dart';
import './Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'qntext': 'What book does Joey get Rachel for her B\'day?',
      'answers': [
        {'text': 'Little Women', 'score': 0},
        {'text': 'The Shining', 'score': 1},
        {'text': 'Love You Forever', 'score': 0},
      ]
    },
    {
      'qntext': 'What is Joey\'s penguins name?',
      'answers': [
        {'text': 'Huggsy', 'score': 1},
        {'text': 'SnowFlake', 'score': 0},
        {'text': 'Waddle', 'score': 0},
      ]
    },
    {
      'qntext': 'How many categories for towels does Monica have?',
      'answers': [
        {'text': '8', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '11', 'score': 1},
      ]
    },
    {
      'qntext': 'What\'s the name of Joey\'s agent?',
      'answers': [
        {'text': 'Emily', 'score': 0},
        {'text': 'Eddith', 'score': 0},
        {'text': 'Estelle', 'score': 1},
      ]
    },
    {
      'qntext': 'What\'s Monica\'s apartment number?',
      'answers': [
        {'text': '15', 'score': 0},
        {'text': '20', 'score': 1},
        {'text': '14', 'score': 0},
      ]
    },
  ];
  var _qnindex = -1;
  var _totalScore = 0;

  void restart() {
    setState(() {
      _qnindex = 0;
      _totalScore = 0;
    });
  }

  void answerqn(int score) {
    _totalScore += score;
    setState(() {
      if (_qnindex < questions.length) {
        _qnindex = _qnindex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The One With The Quiz'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => answerqn(0),
          child: Icon(Icons.arrow_forward),
        ),
        body: _qnindex < questions.length
            ? Quiz(
                answerqn: answerqn,
                qnindex: _qnindex,
                questions: questions,
                start: restart,
              )
            : Result(_totalScore, restart),
      ),
    );
  }
}
