import 'package:flutter/material.dart';

Widget list_builder(context, index) {
  return  ListTile(
    leading: CircleAvatar(
      child: Text(index.toString()),
    ),
    title: Text("Shehanul Islam Rahin"),
    subtitle: Text("contact list"),
    trailing: Icon(Icons.add),
  );
}
