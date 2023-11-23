import 'dart:convert';

import 'package:api_json_decode/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List data = [];

  void getData() async {
  http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  //setState will insert jsonDecode value into data in runtime
  setState(() {
    data = jsonDecode(response.body);
    //print(data);
  });
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    getData();
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(data: data,),
    );
  }
}

