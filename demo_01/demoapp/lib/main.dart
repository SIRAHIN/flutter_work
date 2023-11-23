import 'package:demoapp/custome_widget/list_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('list-builder'),
          centerTitle: true,
        ),

        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => list_builder(context, index)
          ),  
      ),
    );
  }
}
