import 'package:flutter/material.dart';

class featureText extends StatelessWidget {
  final String? text;
  const featureText({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}