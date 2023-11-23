import 'dart:convert';

import 'package:api_json_decode/model/api_model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  
  // final List artical_id; 
  final int index; 


   DetailsPage({super.key, /*required this.artical_id*/ required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

   Map data = {};

   apiModelClass? apiData;
  
  void getPost () async {
    http.Response res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${widget.index+1}'));

    data = jsonDecode(res.body);
    
    setState(() {
      apiData = apiModelClass(data);
    });
  }



  @override
  void initState() {
    getPost();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Details Page"),
        centerTitle: true,
      ),

      body: apiData == null ? Center(child: CircularProgressIndicator()) :Center(
        child: Container(
          height: 500,
          width: 500,
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Details ID - ${apiData!.id}", style: TextStyle(
                fontSize: 30,
                color: Colors.amberAccent
              )),
              SizedBox(height: 10,),
              Text("Details body : - ${apiData!.body}", style: TextStyle(
                fontSize: 20,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}