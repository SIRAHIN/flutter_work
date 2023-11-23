import 'package:flutter/material.dart';

class MainPageNavbarProvider with ChangeNotifier{

  int _currentIndex = 0;

  void setIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }


  int getIndex(){
    return this._currentIndex ;
  }

}