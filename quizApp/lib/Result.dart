import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  @override
  final int res;
  final Function restartHandler;
  Result(this.res, this.restartHandler);
  String get resultPhrase {
    String resultText;
    if (res > 0) {
      resultText = 'You are awesome';
    } else {
      resultText = 'Keep Trying';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 30),
            ),
            textColor: Colors.lightBlueAccent,
            onPressed: restartHandler,
          )
        ],
      ),
    );
  }
}
