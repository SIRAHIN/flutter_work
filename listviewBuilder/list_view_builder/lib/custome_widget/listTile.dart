import 'package:flutter/material.dart';
import '../datasource/userdata.dart';

Widget listTile(context, index){
  return ListTile(
    leading: CircleAvatar(
      child: Text( UserData.data [index] ['id'].toString()),  
    ),

    title: Text(UserData.data [index] ['name']),
    subtitle: Text(UserData.data [index] ['email']),
    trailing: Icon(Icons.person),
    
  );
}