import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  final Function startHandler;
  UI(this.startHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome to Friends Quiz',
              style: TextStyle(fontSize: 30, color: Colors.brown),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                'START',
                style: TextStyle(fontSize: 25, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              onPressed: startHandler,
            )
          ],
        ));
  }
}
