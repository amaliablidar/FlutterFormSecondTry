import 'package:flutter/material.dart';
import 'model/answer.dart';

class Answers with ChangeNotifier{

  List<Answer>? answerList;

  Answers({this.answerList});

  List<Answer>? get answer{
    return answerList;
  }

  void add(Answer answ){
    answerList?.add(answ);
    notifyListeners();
  }
}