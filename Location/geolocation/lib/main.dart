import 'package:flutter/material.dart';
import 'package:geolocation/provider/provider.dart';
import 'package:geolocation/screens/homePage.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GeoProvider(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage()
      ),
    );
  }
}