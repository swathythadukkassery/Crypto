import 'package:flutter/material.dart';

class UI extends StatelessWidget {
  final Function startHandler;
  UI(this.startHandler);
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/cb/c1/74/cbc17461c00cd55c84fd8a39afdbdddd.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(45),
        child: new Column(
          children: <Widget>[
            Text(
              'Welcome to Friends Quiz',
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontSize: 30,
                  color: Colors.cyan[900],
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            RaisedButton.icon(
              icon: Icon(Icons.arrow_drop_down_circle),
              label: Text(
                'START',
                style: TextStyle(fontSize: 25, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              color: Colors.amber,
              onPressed: startHandler,
            ),
            new Container(
              height: 300.0,
              width: 300.0,
            ),
          ],
        ));
  }
}
