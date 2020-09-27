import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session1/news.dart';
import 'categories.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));

List<Category> _categories = [
  Category("General", "This news is general", "https://bl.thgim.com/opinion/pqz60v/article32503389.ece/alternates/LANDSCAPE_435/BL02THINKKEY", Colors.red,Colors.black),
  Category("Business", "This news is business", "https://www.dw.com/image/47219195_401.png", Colors.blue,Colors.white),
  Category("Entertainment", "This news is entertainment", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgvaFiW1RIO_UENljen3guqyYjQzvupAq6Hw&usqp=CAU", Colors.yellow,Colors.black),
  Category("Health", "This news is health", "https://assets.medicalnewstoday.com/content/hl_sharing_v2.jpg", Colors.orangeAccent,Colors.white),
  Category("Science", "This news is science", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvS5ypJPiWFcQceESKWyFSExhc9OS-tTUqAA&usqp=CAU", Colors.brown,Colors.white),
  Category("Sports", "This news is sports", "https://wohspioneer.org/wp-content/uploads/2019/04/sports.png", Colors.black,Colors.white),
  Category("Technology", "This news is technology", "https://www.brandcrowd.com/gallery/brands/pictures/picture14679980797502.png", Colors.grey,Colors.black),
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              elevation: 10.0,
              forceElevated: true,
              shadowColor: Colors.white30,
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "News Category",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                background: Opacity(
                  opacity: 0.3,
                  child: Image.network(
                    "https://5.imimg.com/data5/DR/NW/MY-45108437/newspaper-advertisement-all-india-500x500.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10.0),
              sliver: SliverFixedExtentList(
                itemExtent: 130.0,
                delegate: SliverChildBuilderDelegate(
                    (builder, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                           builder: (context) => MyNews(category : _categories[index].title.toLowerCase()),
                          ),
                        );
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            left: 35.0,
                            child: Container(
                              width: 250,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: _categories[index].backgroundColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15.0,
                            left: 10.0,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(_categories[index].imageUrl),
                              radius: 35.0,
                            ),
                          ),
                          Positioned(
                            left: 80.0,
                            top: 15.0,
                            child: Text(
                              _categories[index].title + " News",
                              style: TextStyle(
                                color: _categories[index].fontColor,
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 85.0,
                            top: 35.0,
                            child: Text(
                              _categories[index].description,
                              style: TextStyle(
                                color: _categories[index].fontColor,
                                fontSize: 10.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  childCount: _categories.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
