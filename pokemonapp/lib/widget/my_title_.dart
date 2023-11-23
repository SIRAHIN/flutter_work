import 'package:flutter/material.dart';

class Mytitle extends StatelessWidget {
  final String? mytitle;
  final Color? myColor;
   Mytitle({
    super.key,
    required this.mytitle, 
    this.myColor
   
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      mytitle!,
      style: TextStyle(fontSize: 30, color: myColor),
    );
  }
}