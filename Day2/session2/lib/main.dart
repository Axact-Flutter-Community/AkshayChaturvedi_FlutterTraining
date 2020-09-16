import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day2 Session2',
      home: Scaffold(
        backgroundColor: Colors.tealAccent[400],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(r"https://i.imgur.com/aWz7QYh.png"),
                radius: 50,
              ),
              Text(
                "Shy Tom",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  fontFamily: 'Lobster'
                ),
              ),
              Text(
                "An animated cartoon character",
                style: TextStyle(
                  fontFamily: "Dance",
                  color: Colors.white70,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 8.0),
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "akshay@gmail.com",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: "Dance",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 8.0),
                    child: Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.red,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              "+91-8057466860",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "Dance",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
