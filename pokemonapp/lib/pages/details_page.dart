import 'package:flutter/material.dart';
import 'package:pokemonapp/widget/feature_text_body.dart';
import 'package:pokemonapp/widget/my_title_.dart';
import 'package:pokemonapp/widget/power_bedge.dart';

import '../widget/feature_text.dart';

class DetailsPage extends StatelessWidget {
  final Map? data;
  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4ad0b0),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 40,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Mytitle(
                            mytitle: "${data!["name"]}",
                            myColor: Colors.white,
                          ),
                        const  SizedBox(height: 5),
                          Row(
                            children: const [
                              powerBadge(
                                text: ["type"],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              powerBadge(
                                text: ["type"],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            height: double.infinity,
                            child: Column(
                              children: [
                                //"height": "0.71 m",
                                // "weight": "6.9 kg",
                                // "candy": "Bulbasaur Candy",
                                // "candy_count": 25,
                                // "egg": "2 km",
                                // "spawn_chance": 0.69,
                                // "avg_spawns": 69,
                                // "spawn_time": "20:00",
                                // "multipliers":

                                featureText(text: "Height :"),
                                featureText(text: "Weight :"),
                                featureText(text: "Candy :"),
                                featureText(text: "Egg :"),
                                featureText(text: "Avg. spawns :"),
                                featureText(text: "Spawn_time :"),
                                featureText(text: "Multipliers :"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            height: double.infinity,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //"height": "0.71 m",
                                // "weight": "6.9 kg",
                                // "candy": "Bulbasaur Candy",
                                // "egg": "2 km",
                                // "avg_spawns": 69,
                                // "spawn_time": "20:00",
                                // "multipliers":

                                featureTextBody(text: "${data!['height']}"),
                                featureTextBody(text: "${data!['weight']}"),
                                featureTextBody(text: "${data!['candy']}"),
                                featureTextBody(text: "${data!['egg']}"),
                                featureTextBody(text: "${data!['avg_spawns']}"),
                                featureTextBody(text: "${data!['spawn_time']}"),
                               
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Positioned(
              
              bottom: 370,
              child: Container(
                child: Hero(
                  tag: "poke-${data!["name"]}",
                  child: Image.network(
                    "${data!["img"]}",
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
