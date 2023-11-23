import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 300,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Third Page'),
            ElevatedButton(
              onPressed: () => context.pop() ,
              child: Text("Go back"),
            ),
      
          ],
        ),
      ),
    );
  }
}
