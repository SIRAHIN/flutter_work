import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoProvider with ChangeNotifier {
  double lat = 0.00;
  double lon = 0.00;
  bool isLoding = true;

  GeoProvider(){
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lon = position.longitude;
    isLoding = false;
    notifyListeners();
   
  }
}
