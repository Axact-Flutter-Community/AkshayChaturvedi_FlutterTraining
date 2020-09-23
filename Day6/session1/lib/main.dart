import 'package:flutter/material.dart';
import 'storyBook.dart';

StoryBook storyBook = StoryBook();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void optionSelected(int i) {
    setState(() {
      storyBook.setIndex(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyStoryApp",
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: NetworkImage(storyBook.getWallpaper()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      child: Text(
                        storyBook.getStory(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(92, 92, 92, 0.5),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          color: Colors.blueAccent,
                          onPressed: () =>
                              optionSelected(storyBook.getFirstIndex()),
                          child: Text(
                            storyBook.getFirst(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Visibility(
                          visible: storyBook.isVisible(),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            color: Colors.tealAccent[700],
                            onPressed: () =>
                                optionSelected(storyBook.getSecondIndex()),
                            child: Text(
                              storyBook.getSecond(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
