import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  final Function startHandler;
  UI(this.startHandler);
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(30),
        child: new Column(
          children: <Widget>[
            Text(
              'Welcome to Friends Quiz',
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                'START',
                style: TextStyle(fontSize: 25, color: Colors.blue),
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
                          'https://i.pinimg.com/236x/e8/74/83/e87483a7448165b5fc9a605327d243c5.jpg'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
          ],
        ));
  }
}
