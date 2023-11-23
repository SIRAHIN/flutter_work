import 'package:flutter/material.dart';
import 'package:quizzi/models/question_temp.dart';

class QuizziQuestion with ChangeNotifier {
  int indexNumber = 0;

  List<QuestionTemp> QuestionAnswerModel = [
    QuestionTemp(question: "Sharks are mammals.", answer: false),
    QuestionTemp(
        question: "The blue whale is the biggest animal to have ever lived.",
        answer: true),
    QuestionTemp(
        question: "The hummingbird egg is the world's smallest bird egg.",
        answer: true),
    QuestionTemp(
        question: "Pigs roll in the mud because they don't like being clean.",
        answer: false),
    QuestionTemp(question: "Bats are blind.", answer: false),
    QuestionTemp(
        question: "A dog sweats by panting its tongue.", answer: false),
  ];

  // void indexofQuestion() {
  //   //compare to listindex with listlength use -1
  //   if (indexNumber < QuestionAnswerModel.length - 1) {
  //     indexNumber = indexNumber + 1;
  //     notifyListeners();
  //   } else {
  //     indexNumber = 0;
  //     notifyListeners();
  //   }
  // }

  List<Widget> listofanswer = [];

  void checktrue() {
    if (QuestionAnswerModel[indexNumber].answer == true) {
      if (indexNumber < QuestionAnswerModel.length - 1) {
        indexNumber = indexNumber + 1;
        notifyListeners();
      } else {
        indexNumber = 0;
        listofanswer = [];
        notifyListeners();
      }
      listofanswer.add(Icon(Icons.check));
      notifyListeners();
    } else {
      if (indexNumber < QuestionAnswerModel.length - 1) {
        indexNumber = indexNumber + 1;
        notifyListeners();
      } else {
        indexNumber = 0;
        listofanswer = [];
        notifyListeners();
      }
      listofanswer.add(Icon(Icons.error_rounded));
      notifyListeners();
    }
  }

  void checkfalse() {
    if (QuestionAnswerModel[indexNumber].answer == false) {
      if (indexNumber < QuestionAnswerModel.length - 1) {
        indexNumber = indexNumber + 1;
        notifyListeners();
      } else {
        indexNumber = 0;
        listofanswer = [];
        notifyListeners();
      }
      listofanswer.add(Icon(Icons.check));
      notifyListeners();
    } else {
      if (indexNumber < QuestionAnswerModel.length - 1) {
        indexNumber = indexNumber + 1;
        notifyListeners();
      } else {
        indexNumber = 0;
        listofanswer = [];
        notifyListeners();
      }
      listofanswer.add(Icon(Icons.error_rounded));
      notifyListeners();
    }
  }
}
