import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiceProvier with ChangeNotifier {
  int leftDice = 2;
  int rightDice = 3;
  int playerPoint = 0;
  int botPoint = 0;

  void payGame (){
    int leftDiceauto = Random().nextInt(6);
    leftDice = leftDiceauto+1;
    notifyListeners();

    int RighttDiceauto = Random().nextInt(6);
    rightDice = RighttDiceauto+1;
    notifyListeners();

    if(leftDiceauto!=RighttDiceauto){
      if(leftDiceauto > RighttDiceauto){
        playerPoint= playerPoint+1;
        notifyListeners();
        if(playerPoint == 5){
          playerPoint = 0;
          botPoint = 0;
          notifyListeners();
        }
      }else{
        botPoint=botPoint+1;
        notifyListeners();
        if(botPoint == 5){
          playerPoint = 0;
          botPoint = 0;
          notifyListeners();
        }
      }
    }
    
  }

 
}