import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionbook.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

QuestionBook questionBook = new QuestionBook();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Day6 session1",
      home: Scaffold(
        backgroundColor: Colors.black45,
        body: QuizFrame(),
      ),
    );
  }
}

class QuizFrame extends StatefulWidget {
  @override
  _QuizFrameState createState() => _QuizFrameState();
}

class _QuizFrameState extends State<QuizFrame> {
  int score = 0;
  bool disabled = false;
  List<Widget> icons = new List();
  void reset(){
    setState(() {
      disabled = false;
      icons.clear();
      score = 0;
      questionBook.initialize();
    });
  }
  void check(bool ans){
    setState(() {
      if(!disabled) {
        if (questionBook.getAnswer() == ans) {
          score++;
          icons.add(Icon(Icons.check, color: Colors.green,),);
        }
        else {
          icons.add(Icon(Icons.close, color: Colors.red,),);
        }
        if (questionBook.isDone()) {
          disabled = true;
          Alert(
            context: context,
            title: "Game Over!",
            desc: "Your score is: $score",
            buttons: [
              DialogButton(
                child: Text(
                  "Play Again ?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () =>
                {
                  reset(),
                  Navigator.pop(context),
                },
                color: Colors.teal,
              ),
            ],
          ).show();
        }
        else {
          questionBook.next();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                questionBook.getQuestion(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: FlatButton(
                      onPressed: () => check(true),
                      color: Colors.green,
                      child: Text(
                        "True",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () => check(false),
                      child: Text(
                        "False",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                        ),
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  ),
                  Container(
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: icons,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}