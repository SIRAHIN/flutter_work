import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home Page'),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter Name'
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed('secondPage',pathParameters: {'name':'${controller.text}'}),
              child: Text("Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}
