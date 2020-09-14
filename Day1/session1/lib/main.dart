import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day1_Session1',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Day 1 Session 1"),
        ),
        body: Center(
          child: Text("First App"),
        ),
      ),
    );
  }

}