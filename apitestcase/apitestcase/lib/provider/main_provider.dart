import 'dart:convert';

import 'package:apitestcase/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainProvider with ChangeNotifier {


  MainProvider()  {
     FeatchAllData();
  }

  List<UserModel> FeatchDataList = [];

  bool visibility = true;

  Future FeatchAllData() async {
    visibility = false;
    notifyListeners();
    http.Response res = await http.get(Uri.parse('https://64a016efed3c41bdd7a6fbaf.mockapi.io/bottweet'));
    if(res.statusCode == 200){
      visibility = true;
      notifyListeners();
      var datalist = jsonDecode(res.body);
      datalist.forEach((element) {
        FeatchDataList.add(UserModel.fromJson(element));
      });
      
    }else{
      return null;
    }
  }

}