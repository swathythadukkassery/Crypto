import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  final Function startHandler;
  UI(this.startHandler);
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(45),
        child: new Column(
          children: <Widget>[
            Text(
              'Welcome to Friends Quiz',
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontSize: 30,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                'START',
                style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              onPressed: startHandler,
            ),
            new Container(
              height: 300.0,
              width: 300.0,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/4e/a7/f8/4ea7f8eb6008ab85769c8e91f35f30a5.jpg'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
          ],
        ));
  }
}
