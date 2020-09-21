import 'dart:collection';
import 'questions.dart';

class QuestionBook{
  int _index = 0;
  List<Question> _questionBook=[
    Question("Is your name Akshay",true),
    Question("Is your name Mota",true)
  ];
  void initialize(){
    _questionBook.shuffle();
    _index = 0;
  }
  String getQuestion(){
    return _questionBook[_index].question;
  }
  bool getAnswer(){
    return _questionBook[_index].answer;
  }
  void next(){
    _index++;
  }
  bool isDone(){
    return _index >= _questionBook.length-1;
  }
}