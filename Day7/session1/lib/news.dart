import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';

class MyNews extends StatefulWidget {
  final String category;
  MyNews({Key key, @required this.category}) : super(key : key);
  @override
  _MyNewsState createState() => _MyNewsState(category);
}

class _MyNewsState extends State<MyNews> {
  String _category;
  List _fetchedData;
  _MyNewsState(this._category);

  Future<String> fetchData() async{
    var _data = await http.get("https://newsapi.org/v2/top-headlines?country=in&category=$_category&apiKey=5b3784c38ccf4e99a23174d7ab0b80e4");
    var _formattedData = jsonDecode(_data.body);
    setState(() {
      _fetchedData = _formattedData["articles"];
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Stack(
            overflow: Overflow.visible,
            children: [
              Image(
                height: height*0.5,
                width: width,
                image: NetworkImage(_fetchedData[index]["urlToImage"]??"https://revisionmanufacture.com/assets/uploads/no-image.png"),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: height*0.4,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                    ),
                    color: Color.fromRGBO(35, 35, 35, 1),
                  ),
                ),
              ),
              Positioned(
                top: height*0.4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                  child:Column(
                    children: [
                      Container(
                        width: width * 0.9,
                        child: Text(
                          _fetchedData[index]["title"]??"Title Not Found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: width *0.9,
                        child: Text(
                          _fetchedData[index]["content"]??"Content Not Found",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              Positioned(
                top: height * 0.4,
                right: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 1.0),
                  child: Container(
                    width: width * 0.3,
                    child: Center(
                      child: Text(
                        _fetchedData[index]["publishedAt"].substring(0,10),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: _fetchedData==null?0:_fetchedData.length,
      ),
    );
  }
}
