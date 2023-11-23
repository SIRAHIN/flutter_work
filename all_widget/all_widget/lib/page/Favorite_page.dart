import 'package:flutter/material.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
           color: Colors.deepPurple,
          height: 240,
          width: 240,
          child: Center(child: Text("This is FavoritePage Page", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}