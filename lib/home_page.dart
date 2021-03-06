import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  // Initialize all variables
  var num1 = '0',
      num2 = '0',
      ansStr = '0',
      ans = 0,
      operation = '',
      equalsFlag = 0;

  // Operation (+, -, *, /, =, clear) functions
  void _add() {
    setState(() {
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
    });
  }

  void _multiply() {
    setState(() {
      operation = '*';
      if (equalsFlag == 0) {
        num2 = num1;
      }
      else {
        num2 = ansStr;
      }

      num1 = '0';
    });
  }

  void _divide() {
    setState(() {
      operation = '/';
      if (equalsFlag == 0) {
        num2 = num1;
      }
      else {
        num2 = ansStr;
      }

      num1 = '0';
    });
  }

  void _equals() {
    setState(() {
      if (operation == '+') {
        ans = int.parse(num1) + int.parse(num2);
        equalsFlag++;
      }
      else if (operation == '-') {
        ans = int.parse(num2) - int.parse(num1);
        equalsFlag++;
      }
      else if (operation == '*') {
        ans = int.parse(num2) * int.parse(num1);
        equalsFlag++;
      }
      else if (operation == '/') {
        ans = int.parse(num2) ~/ int.parse(num1);
        equalsFlag++;
      }
      ansStr = "$ans";
    });
  }

  void _clear() {
    setState(() {
      num1 = '0';
      num2 = '0';
      ansStr = '0';
      ans = 0;
      operation = '';
      equalsFlag = 0;
    });
  }

  void _one() {
    setState(() {
      num1 += "1";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _two() {
    setState(() {
      num1 += "2";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _three() {
    setState(() {
      num1 += "3";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _four() {
    setState(() {
      num1 += "4";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _five() {
    setState(() {
      num1 += "5";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _six() {
    setState(() {
      num1 += "6";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _seven() {
    setState(() {
      num1 += "7";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _eight() {
    setState(() {
      num1 += "8";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _nine() {
    setState(() {
      num1 += "9";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  void _zero() {
    setState(() {
      num1 += "0";
      ans = int.parse(num1);
      ansStr = "$ans";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // Provides APIs for showing App Bar, Drawers, Bottom Navigation, etc.
        appBar: new AppBar( // Defines the content of the Appbar
          title: new Text('Calculator'),
        ),
        body: new Container( //Defines the content of the body, creates display screen for
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ // Column widget uses the children property
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight, // Align text
//              color: Colors.white, // Set background color
                child: Text(
                  '$ansStr',
                  style: TextStyle(
                    fontSize: 50.0,
//                  color: Colors.black
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("7", _seven), // Using custom widget _button
                  _button("8", _eight),
                  _button("9", _nine),
                  _button("+", _add)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("4", _four), // Using custom widget _button
                  _button("5", _five),
                  _button("6", _six),
                  _button("-", _subtract)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("1", _one), // Using custom widget _button
                  _button("2", _two),
                  _button("3", _three),
                  _button("*", _multiply)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("C", _clear), // Using custom widget _button
                  _button("0", _zero),
                  _button("=", _equals),
                  _button("/", _divide)
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