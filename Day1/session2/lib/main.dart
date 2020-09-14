import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("First Basic App"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(r"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRnuFfc9BILQPPTxGYL5KEeMl5C3AzCn95qCQ&usqp=CAU"),
                Image.asset("images/1.PNG"),
              ],
            ),
        ),
      ),
    );
  }

}