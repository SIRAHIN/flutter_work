import 'package:flutter/material.dart';

class powerBadge extends StatelessWidget {
  final List<String>? text;
  const powerBadge({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ListView.builder(
        itemCount: text?.length ??0,
        itemBuilder:(context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(26.0),
            ),
          ),
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
        margin: EdgeInsets.symmetric(vertical: 3.0),
      
          child: Center(
            child: Text(text![index],
            style: TextStyle(fontSize: 16.0,
            color: Colors.white
            ),
            ),
          ),
        ),
      ),
    );
  }
}