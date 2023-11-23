import 'dart:convert';

import 'package:http/http.dart' as http;

class ip_info_detailes{
  
  static Future<Map> getDetailes  (String ipController) async {
    http.Response res = await http.get(Uri.parse("https://ipinfo.io/$ipController/geo"));
    if(res.statusCode==200){
      return jsonDecode(res.body);
    }
    else{
      return  {
      "ip": "Failed to fetch ip",
      "city": "Failed",
      "region": "Failed",
      "country": "Failed",
      "loc": "Failed",
      "org": "Failed",
      "postal": "Failed",
      "timezone": "Failed",
    }; 
    }
  }
}