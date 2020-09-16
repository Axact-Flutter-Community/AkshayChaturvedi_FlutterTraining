import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Day3 session1",
      home: Scaffold(
        backgroundColor: Colors.red,
        body: MyApp(),
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDice = 1,rightDice = 6;
  String winner = "Tap the button to start";
  void rollDice(){
    setState(() {
      leftDice = Random().nextInt(6)+1;
      rightDice = Random().nextInt(6)+1;
      if(leftDice > rightDice) winner = "Left player won";
      else if(rightDice > leftDice) winner = "Right player won";
      else winner = "It's a draw";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/dice$leftDice.png"),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/dice$rightDice.png"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "$winner",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          RaisedButton(
            child: Text("Roll Dice"),
            onPressed: rollDice,
            color: Colors.white,
            textColor: Colors.red,
            splashColor: Colors.grey,
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
