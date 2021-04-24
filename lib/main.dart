import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int addedDice = 2;
  int rollsMade = 0;

  void changeDiceFace() {
    setState(() {
      rollsMade++;
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      addedDice = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset(
                  'images/dice$leftDiceNumber.png',
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  '$leftDiceNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$rightDiceNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.casino,
                      color: Colors.red,
                    ),
                    title: Text(
                      'The total rolled is $addedDice.\nYou have rolled $rollsMade times.',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
