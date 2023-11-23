import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapptest/providers/getloc_provider.dart';
import 'package:weatherapptest/screens/weatherpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetLoc_Provider(),
      builder: (context, child) => 
        MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: WeatherPage()
      ),
    );
  }
}