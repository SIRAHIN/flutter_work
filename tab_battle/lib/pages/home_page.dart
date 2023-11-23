import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int flexRed = 30;

  static int flexBlue = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: flexBlue,
                child: GestureDetector(
                  child: Container(
                    color: Colors.blue,
                  ),
                  onTap: () {
                    setState(() {
                      flexBlue = flexBlue + 1;
                      flexRed = flexRed - 1;
                    });
                  },
                ),
              ),
              Expanded(
                flex: flexRed,
                child: GestureDetector(
                  child: Container(
                    color: Colors.redAccent,
                  ),
                  onTap: () {
                    setState(() {
                      flexRed = flexRed + 1;
                      flexBlue = flexBlue - 1;
                    });
                  },
                ),
              ),
            ],
          ),
          flexRed == 60 || flexBlue == 60
              ? Positioned(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.deepPurple[300],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${flexRed == 60 ? "Red" : "Blue"} Won!",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Colors.amberAccent,
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    flexRed = 30;

                                    flexBlue = 30;
                                   
                                  });
                                },
                                child: Text("Restart"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
