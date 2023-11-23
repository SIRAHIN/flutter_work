import 'package:flutter/material.dart';
import 'package:tictactoe/enum/boxState.dart';
// ignore: camel_case_types
class boxGrid extends StatelessWidget {
  final Widget? boxIcon;
 
  
   const boxGrid( {
    super.key,
    required this.boxIcon,

   
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
      color : Colors.deepPurple,
      child: boxIcon,
        ),);
  }
}