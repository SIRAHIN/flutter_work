import 'package:flutter/material.dart';
import 'custome_widget/listTile.dart';
import 'datasource/userdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViewBuilder-MAP"),
          centerTitle: true,
        ),

        body: Container(
          child: ListView.builder(
            itemCount: UserData.data.length,
            itemBuilder: (context, index) => listTile(context, index)
          ),
        ),
      )
    );
  }
}
