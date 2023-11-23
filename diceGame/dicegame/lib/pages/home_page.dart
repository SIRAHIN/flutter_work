

import 'package:dicegame/provider/dice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.8,
              image: AssetImage('assets/images/bg_.png'),
              fit: BoxFit.cover
            )
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              diceImage(),

              SizedBox(height: 50,),
              ElevatedButton(onPressed: () {
                Provider.of<DiceProvier>(context, listen: false).payGame();
              }, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              ),
              child: const Text("play",
              style:  TextStyle(fontSize: 15),
              )),

             SizedBox(height: 45,),

              Consumer<DiceProvier>(
                builder: (context, value, child) => 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Player", style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('${value.playerPoint}',
                        style:   TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
              
                     Column(
                      children: [
                        Text("Bot", style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('${value.botPoint}',
                        style:   TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    ),
    );
  }
}



class diceImage extends StatelessWidget {
  const diceImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceProvier>(
      builder: (context, value, child) => 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 150,
            width: 140 ,
            //color: Colors.amber,
            decoration:  BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/images/dice-${value.leftDice}.png"),
              )
            ),
          ),
          Container(
            height: 150,
            width: 140 ,
          //  color: Colors.pinkAccent,
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dice-${value.rightDice}.png"))
            ),
          ),
        ],
      ),
    );
  }
}