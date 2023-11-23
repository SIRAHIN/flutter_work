import 'package:api_json_decode/main.dart';
import 'package:api_json_decode/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final List data;
  const SplashScreen({super.key, required this.data});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(const Duration(seconds: 2), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(data: widget.data))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}