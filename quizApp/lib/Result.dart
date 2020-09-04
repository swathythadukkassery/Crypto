import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  final int res;
  final Function restartHandler;
  Result(this.res, this.restartHandler);
  String get resultPhrase {
    String resultText;
    if (res > 0) {
      resultText = 'Congrats!';
    } else {
      resultText = 'Keep Trying';
    }

    return resultText;
  }

  String a = 'Your score is : ';
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/564x/cb/c1/74/cbc17461c00cd55c84fd8a39afdbdddd.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 16.0),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.right,
          ),
          Text(
            '$a$res',
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
            textColor: Colors.white,
            onPressed: restartHandler,
          ),
        ],
      ),
    );
  }
}
