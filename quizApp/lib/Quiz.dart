import 'package:flutter/material.dart';

import 'Answer.dart';
import 'Question.dart';
import 'UI.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerqn;
  final Function start;
  final int qnindex;
  @override
  Quiz({this.questions, this.answerqn, this.qnindex, this.start});

  Widget build(BuildContext context) {
    return qnindex >= 0
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.shutterstock.com/image-illustration/question-mark-on-green-background-260nw-582089944.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58482.jpg'),
                        radius: 40.0,
                      ),
                    ),
                    Divider(
                      height: 90,
                      color: Colors.blue,
                    ),
                    Question(
                      questions[qnindex]['qntext'],
                    ),
                    ...(questions[qnindex]['answers']
                            as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(
                          () => answerqn(answer['score']), answer['text']);
                    }).toList()
                  ],
                )),
          )
        : UI(start);
  }
}
