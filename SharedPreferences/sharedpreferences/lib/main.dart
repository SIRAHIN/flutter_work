import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _controller = TextEditingController();
  late SharedPreferences sp;  
  String inputText = '';

   Future <SharedPreferences> init ()async{
   return sp = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(onPressed: ()  {
              sp.setString('Name', _controller.text)  ;
            }, child: const Text("Save")),

           const SizedBox(height: 25,),


            ElevatedButton(onPressed: () {
              
              setState(() {
                inputText = sp.getString('Name').toString();
              });
            }, child: const Text("Show")),
           const SizedBox(height: 20,),

            Text('$inputText')

          ],
        )
      ),
    );
  }
}