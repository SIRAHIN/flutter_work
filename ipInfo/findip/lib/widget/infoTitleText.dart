import 'package:flutter/material.dart';

class InfoTitleText extends StatelessWidget {
   // ignore: prefer_typing_uninitialized_variables
   final  text;
    const InfoTitleText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Text(text,
      style: const TextStyle(
        fontFamily: 'Urbanist',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
      ),
    );
  }
}