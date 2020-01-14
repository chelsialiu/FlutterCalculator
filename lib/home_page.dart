import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  // Initialize all variables
  var num1 = '0', num2 = '0', ansStr = '0', ans = 0, operation = '', equalsFlag = 0;

  // Operation (+, -, *, /) functions
  void _add(){
    setState((){
      operation = '+';
      if (equalsFlag == 0) { // If the '=' button has not been pressed yet
        num2 = num1;
      }
      else {
        num2 = ansStr;
      }

      num1 = '0';
    });
  }

  void _subtract() {
    setState(() {
      operation = '-';
      if (equalsFlag == 0) {
        num2 = num1;
      }
      else {
        num2 = ansStr;
      }

      num1 = '0';
    })
  }

  @override
  Widget build (BuildContext context) {
    return new Scaffold( // Provides APIs for showing App Bar, Drawers, Bottom Navigation, etc.
      appBar: new AppBar( // Defines the content of the Appbar
        title: new Text('Calculator'),
      ),
      body: new Container( //Defines the content of the body, creates display screen for
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[ // Column widget uses the children property
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight, // Align text
              color: Colors.white, // Set background color
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("C"), // Using custom widget _button
                _button("()"),
                _button("%"),
                _button("/")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7"), // Using custom widget _button
                _button("8"),
                _button("9"),
                _button("*")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4"), // Using custom widget _button
                _button("5"),
                _button("6"),
                _button("-", _subtract)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1"), // Using custom widget _button
                _button("2"),
                _button("3"),
                _button("+", _add)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("+/-"), // Using custom widget _button
                _button("0"),
                _button("."),
                _button("=")
              ],
            )
          ],
        ),
      )
    );
  }
}

Widget _button (String number, Function() f){ // Creating a method of return type Widget with number and function f as a param
  return MaterialButton(
    height: 100.0,
    child: Text(number,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
    textColor: Colors.black,
    color: Colors.grey[100],
    onPressed: f,
    );
}