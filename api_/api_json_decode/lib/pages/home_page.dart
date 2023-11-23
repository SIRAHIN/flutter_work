import 'package:api_json_decode/model/api_model_class.dart';
import 'package:api_json_decode/pages/details_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final List data;

  const HomePage({
    super.key,
    required this.data,
  });


  

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => 
        
        ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailsPage(/*artical_id : data,*/ index : index),
            ),
          ),
          leading: CircleAvatar(
            child: Text(data[index]['title']),
          ),
          title: Text(data[index]['title']),
        ),
        
        ),
      
     
    );
  }
}