import 'package:flutter/material.dart';

class BmiProvider with ChangeNotifier {
  
   Color? MaleColor = Colors.amberAccent;
   Color? FemaleColor = Colors.amberAccent;
   selectGendercolor (String gender){
    if(gender == 'male'){
      MaleColor=Colors.blueAccent[700];
      FemaleColor = Colors.amberAccent;
     
    }  if(gender == 'female'){
      FemaleColor=Colors.pinkAccent[400];
      MaleColor = Colors.amberAccent;
      
    }
  notifyListeners();
  }


  double sliderValue = 145;
  void getSliderValue (double value){
    sliderValue = value;
    notifyListeners();
  }



  int weight = 55;
    AddWeight(){
    weight = weight+1;
    notifyListeners();
  }

  void SubWeight(){
    weight = weight-1;
    notifyListeners();
  }



  int age = 25;
  void AddAge(){
    age = age+1;
    notifyListeners();
  }

  void SubAge(){
    age = age-1;
    notifyListeners();
  }


  double calculateBmi(){
    double heightSquare = sliderValue * sliderValue;
    double result = weight / heightSquare;
    return result;
  }

  void resetvalue(){
    sliderValue = 145;
    weight = 55;
    age =  25 ;
    MaleColor = Colors.amberAccent;
   FemaleColor = Colors.amberAccent;
   notifyListeners();

  }

}


