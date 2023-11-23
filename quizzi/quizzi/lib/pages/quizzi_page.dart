import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzi/models/quizzi_question.dart';

class QuizziPage extends StatelessWidget {
  const QuizziPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       
        children: [

          Consumer<QuizziQuestion>(
            builder: (context, value, child) => 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                height: 400,
                width: double.infinity,
                child: Center(child: Text("${value.QuestionAnswerModel[value.indexNumber].question}",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,

                ),
                )),
              ),
            ),
          ),

          InkWell(
            onTap: () {
             // Provider.of<QuizziQuestion>(context, listen: false).indexofQuestion();
              Provider.of<QuizziQuestion>(context, listen: false).checktrue();
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  height: 40,
                  width: 120,
                  child: Center(
                    child: Text(
                      'T R U E',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),

           InkWell(
            onTap: () {
             // Provider.of<QuizziQuestion>(context, listen: false).indexofQuestion();
              Provider.of<QuizziQuestion>(context, listen: false).checkfalse();
            },
             child: Padding(
               padding: const EdgeInsets.all(18.0),
               child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Container(
                  height: 40,
                  width: 120,
                  child:  Center(
                    child: Text(
                      'F A L S E',
                      style:  TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.deepPurple,
                ),
                       ),
             ),
           ),

          Consumer<QuizziQuestion>(
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: value.listofanswer
              ,
            ),
          )
        ],
      ),
    ));
  }
}
