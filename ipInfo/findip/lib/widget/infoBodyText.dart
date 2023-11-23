import 'package:flutter/material.dart';

class InfoBodyText extends StatelessWidget {
   // ignore: prefer_typing_uninitialized_variables
   final  text;
    const InfoBodyText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Text(text,
      style: const TextStyle(
        fontFamily: 'Urbanist',
        color: Colors.grey,
        fontWeight: FontWeight.w100,
        fontSize: 18
      ),
      ),
    );
  }
}