import 'package:flutter/material.dart';
import 'package:pokemonapp/pages/details_page.dart';

import 'power_bedge.dart';

class grid_container extends StatelessWidget {
  final String? name;
  final List <String>  type;
  final String? img;
  final Map? pokemonMap;
  
  const grid_container({
    super.key, 
    required this.name, 
    required this.type, 
    required this.img, 
    required this.pokemonMap
    
    });



  @override
  Widget build(BuildContext context) {
    return  InkWell(
    onTap: () => {
     Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailsPage(
        data : pokemonMap
      ),)
     )
    },
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 12.0),
          margin: EdgeInsets.all(2.0),
          width: double.infinity,
          decoration: BoxDecoration(
            

            color: Color(0xff4ad0b0),



            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  name!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                      
                      ),
                ),
              ),
              
          

              powerBadge(text: pokemonMap!['type']),
              //powerBadge(text: "${type[1]}"),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Hero(
            tag: "poke-${pokemonMap!["name"]}",
            child: Image.network(
              img!,
              width: 110,
            ),
          ),
        ),
      ],
    ),
  );
}

  }


