import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  bool? eligibility;
  String? eligibilityMessage='';

  void changeEligibility ({required int userInput}){
    if(userInput > 18){
      eligibility = true;
      eligibilityMessage='You can proceed to the application process.';
      notifyListeners();
    }else{
      eligibility = false;
      eligibilityMessage='Not accepted.';
      notifyListeners();
    }
  }
}