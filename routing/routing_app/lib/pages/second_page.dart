import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String? name;
  SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name!),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Go back")),
            ],
          ),
        ),
      ),
    );
  }
}