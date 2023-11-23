import 'package:flutter/material.dart';
import 'package:tictactoe/enum/boxState.dart';
import 'package:tictactoe/enum/game_state.dart';

import '../widgets/box_grid.dart';
import '../widgets/box_state_icon.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  //first Row
  boxState a = boxState.empty;

  boxState b = boxState.empty;

  boxState c = boxState.empty;

  //Second Row
  boxState d = boxState.empty;

  boxState e = boxState.empty;

  boxState f = boxState.empty;

  //Thirs Row
  boxState g = boxState.empty;

  boxState h = boxState.empty;

  boxState i = boxState.empty;

  //reset box State
  void resetBoxState() {
    a = boxState.empty;

    b = boxState.empty;

    c = boxState.empty;

    //Second Row
    d = boxState.empty;

    e = boxState.empty;

    f = boxState.empty;

    //Thirs Row
    g = boxState.empty;

    h = boxState.empty;

    i = boxState.empty;
  }

  //Turn State
  bool isCrossTurn = true;

  //Game State
  GameState gameState = GameState.draw;

  //Game Logic
  void gameScoreUpdate() {
    //First Row
    if (a == b && b == c && a != boxState.empty) {
      if (a == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (d == e && e == f && d != boxState.empty) {
      if (d == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (g == h && h == i && g != boxState.empty) {
      if (g == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (a == d && d == g && a != boxState.empty) {
      if (a == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (b == e && e == h && b != boxState.empty) {
      if (b == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (c == f && f == i && c != boxState.empty) {
      if (c == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (a == e && e == i && a != boxState.empty) {
      if (a == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }

    if (c == e && e == g && c != boxState.empty) {
      if (c == boxState.cross) {
        gameState = GameState.crossWon;
      } else {
        gameState = GameState.circleWon;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "T U R N",
                        style: TextStyle(
                            fontSize: 25, color: Colors.deepOrangeAccent),
                      ),
                      Text(
                        isCrossTurn ? "X" : "O",
                        style:
                            TextStyle(fontSize: 50, color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  children: [
                    //1st Row
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (a == boxState.empty) {
                            if (isCrossTurn) {
                              a = boxState.cross;
                            } else {
                              a = boxState.circle;
                            }
                            //returning false value.
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: a),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (b == boxState.empty) {
                            if (isCrossTurn) {
                              b = boxState.cross;
                            } else {
                              b = boxState.circle;
                            }
                          }
                          isCrossTurn = !isCrossTurn;
                          gameScoreUpdate();
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: b),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (c == boxState.empty) {
                            if (isCrossTurn) {
                              c = boxState.cross;
                            } else {
                              c = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: c),
                      ),
                    ),

                    //2nd Row
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (d == boxState.empty) {
                            if (isCrossTurn) {
                              d = boxState.cross;
                            } else {
                              d = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: d),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (e == boxState.empty) {
                            if (isCrossTurn) {
                              e = boxState.cross;
                            } else {
                              e = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: e),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (f == boxState.empty) {
                            if (isCrossTurn) {
                              f = boxState.cross;
                            } else {
                              f = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: f),
                      ),
                    ),

                    //3rd Row
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (g == boxState.empty) {
                            if (isCrossTurn) {
                              g = boxState.cross;
                            } else {
                              g = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: g),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (h == boxState.empty) {
                            if (isCrossTurn) {
                              h = boxState.cross;
                            } else {
                              h = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: h),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (i == boxState.empty) {
                            if (isCrossTurn) {
                              i = boxState.cross;
                            } else {
                              i = boxState.circle;
                            }
                            isCrossTurn = !isCrossTurn;
                            gameScoreUpdate();
                          }
                        });
                      },
                      child: boxGrid(
                        boxIcon: BoxStateIcon(boxStateIcon: i),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 50.0,
            left: 125,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                onPressed: () {
                  setState(() {
                    gameState = GameState.draw;
                    resetBoxState();
                    isCrossTurn = true;
                  });
                },
                child: const Text("PLAY AGAIN",
                style: TextStyle(
                  fontSize: 20
                ),
                )
                ),
          ),

          //Winning Page
          gameState != GameState.draw
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.deepPurpleAccent.withOpacity(.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${gameState == GameState.circleWon ? "O" : "X"}  WON",
                        style: const TextStyle(fontSize: 44.0, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              gameState = GameState.draw;
                              resetBoxState();
                              isCrossTurn = true;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 120,
                            color: Colors.orangeAccent,
                            child: const Center(
                              child: Text(
                                "RESTART",
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
