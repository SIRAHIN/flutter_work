import 'package:bmi/pages/bmiMainPage.dart';
import 'package:bmi/providers/bmiprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      builder: (context, child) => 
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: BmiMainPage()
      ),
    );
  }
}