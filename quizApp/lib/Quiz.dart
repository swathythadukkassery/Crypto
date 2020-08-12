import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerqn;
  final int qnindex;
  @override
  Quiz({this.questions, this.answerqn, this.qnindex});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[qnindex]['qntext'],
        ),
        ...(questions[qnindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerqn(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
