import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String qnText;
  Question(this.qnText);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              qnText,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[900]),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
