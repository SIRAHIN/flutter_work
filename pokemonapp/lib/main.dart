import 'package:flutter/material.dart';
import 'package:pokemonapp/pages/details_page.dart';
import 'package:pokemonapp/widget/grid_container.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokemonApp',
      home: HomePage(),
     // home: DetailsPage(),
    );
  }
}

