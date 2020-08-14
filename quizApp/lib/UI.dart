import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  final Function startHandler;
  UI(this.startHandler);
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.redAccent,
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
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQL5KnraMfmz0PicP7a1NsP1pfPVpVk-QbVxA&usqp=CAU'),
                      fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
          ],
        ));
  }
}
