import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class TaskTakingRepositoris{

  //Save Note Function
  static Future saveNote({required BuildContext context, required String TitleText, required String bodyText}) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('notes');
    if (TitleText.isEmpty ||
        bodyText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Empty Note!',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amberAccent,
      ));
    } else {
      await collectionReference.add({
        'title': TitleText,
        'body': bodyText
      });
    }
  }

  //GetNotes Function
  static Stream<QuerySnapshot<Map<String, dynamic>>> getNots() {
    return FirebaseFirestore.instance.collection('notes').snapshots();
  }

  //Delete Notes
  static void deleteNote(String path) async {
    await FirebaseFirestore.instance.collection('notes').doc(path).delete();
  }

  //Update notes
  static void updateNote(String path, String TitleText, String bodyText) async {
    await FirebaseFirestore.instance.collection('notes').doc(path).update({
      'title': TitleText,
      'body': bodyText
    });
  }
}