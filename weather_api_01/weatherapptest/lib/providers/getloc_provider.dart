import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapptest/model/weather_model.dart';

class GetLoc_Provider with ChangeNotifier {

  double lat = 0.0;
  double lon = 0.0;
  String city = '--.--';
  String temp = '';
  String description = '--.--';
  String humidity = '--.--';
  String feels = '--.--';
  String pressure = '--.--';

  bool isLooding  = false;

  GetLoc_Provider(){
    getlocation();
  }

   void getlocation () async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lon = position.longitude;
    isLooding = false;
    notifyListeners();
  }


  WeatherModel? weatherData;

  


  getweatherApi (String cityname) async {
    
    isLooding = true;
    notifyListeners();
    
    http.Response response =  await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=ee1b226bec0bae5c7ebf0661f01db8c4&units=metric")); 
   
    Map <dynamic,dynamic> data = jsonDecode(response.body);

    

    if(response.statusCode == 200) {
   
     weatherData = WeatherModel.fromJson(data);
     isLooding = false;
     notifyListeners();
    
    }
   
    
    notifyListeners();
  
    
  }


  

}