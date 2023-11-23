import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  final String? name;
   SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Second Page value is $name'),
            ElevatedButton(
              onPressed: () => context.goNamed('thirdPage'),
              child: Text("Third Page"),
            ),
          ],
        ),
      ),
    );
  }
}
