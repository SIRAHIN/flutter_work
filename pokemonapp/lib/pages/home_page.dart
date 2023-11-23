import 'package:flutter/material.dart';
import 'package:pokemonapp/dataSource/pokemon_datasource.dart';

import '../widget/grid_container.dart';
import '../widget/my_title_.dart';

class HomePage extends StatelessWidget {
   HomePage({
    super.key,
  });

  List <Map?>? pokemonsData = pokemonDataSource.pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.menu_sharp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Mytitle(mytitle: "Pokedex", 
              myColor: Colors.black,
              ),
            ),
            Expanded(
              flex: 12,
              child: GridView.builder(
                itemCount: pokemonsData!.length,
                itemBuilder: (context, index) => grid_container(
                  
                  name: "${pokemonsData! [index]! ['name']}",
                  // type: [
                  //   pokemonsData! [index]!.containsKey('type')
                  //   ? pokemonsData! [index]! ['type']
                  //   : ['No Power'],
                  // ],
                  type: ['type', 'type'],
              
                  img: pokemonsData! [index]! ['img'],
              
                  pokemonMap : pokemonsData![index],
                ), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5/4.5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


