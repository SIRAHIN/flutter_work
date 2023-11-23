import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzi/pages/quizzi_page.dart';

import 'models/quizzi_question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => QuizziQuestion(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: QuizziPage()
      ),
    );
  }
}