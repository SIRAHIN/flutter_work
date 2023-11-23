import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class featureTextBody extends StatelessWidget {
  final String text;
  const featureTextBody({super.key,
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: Text(text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
        )
        ),
      ),
    );
  }
}