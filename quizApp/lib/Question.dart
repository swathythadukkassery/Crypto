import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String qnText;
  Question(this.qnText);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        qnText,
        style: TextStyle(fontSize: 28, color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
  }
}
