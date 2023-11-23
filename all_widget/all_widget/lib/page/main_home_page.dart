import 'package:flutter/material.dart';


class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.deepPurple,
            height: 240,
            width: 240,
            child: Center(child: Text("This is MainHomePage Page", style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    );
  }
}