import 'dart:io';

import 'user.dart';


void main() {
  print("please enter your Name :");
  String? Nuser = stdin.readLineSync();

  print("\n");

  print("please Enter your PassWord");
  String? Puser = stdin.readLineSync();

  bool? Justify = User.Ulogin(Name: Nuser!, Password: Puser!);
  
  print("\n");
  print('User login : ${Justify}');
  
}