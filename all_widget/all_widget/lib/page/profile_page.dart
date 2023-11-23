import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.deepPurple,
          height: 240,
          width: 240,
          child: Center(child: Text("This is ProfilePage Page", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}