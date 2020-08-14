import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  final int res;
  final Function restartHandler;
  Result(this.res, this.restartHandler);
  String get resultPhrase {
    String resultText;
    if (res > 0) {
      resultText = 'Your Score is';
    } else {
      resultText = 'Keep Trying, Your Score is:';
    }

    return resultText;
  }

  String get resu {
    String resu;
    resu = res.toString();
    return resu;
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/736x/a7/04/c6/a704c607c003cc4fd20af4fe3f97ed8e.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 200.0),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber),
            textAlign: TextAlign.center,
          ),
          Text(
            resu,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]),
            textAlign: TextAlign.end,
          ),
          RaisedButton(
            color: Colors.black,
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 30),
            ),
            textColor: Colors.amber,
            onPressed: restartHandler,
          ),
        ],
      ),
    );
  }
}
