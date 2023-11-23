import 'package:flutter/material.dart';


class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
           color: Colors.deepPurple,
          height: 240,
          width: 240,
          child: Center(child: Text("This is MessagePage Page", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}