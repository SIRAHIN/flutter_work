import 'package:flutter/material.dart';
import 'package:routing_app/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>SecondPage(name: "Rahin"),),);
        },
        child: Text('Go to Second page'),
        ),
      ),
    );
  }
}