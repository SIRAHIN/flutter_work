
// ignore: camel_case_types



import 'dart:convert';

import 'package:http/http.dart' as http;

class ip_info{
  static Future<String> getMyiP () async {
    http.Response response = await http.get(Uri.parse("https://api.ipify.org/?format=json"));
    if(response.statusCode == 200){
      //return jsonDecode(response.body)['ip'];
      
      String resbody = response.body;
      Map resMap = jsonDecode(resbody);
      String resIp = resMap['ip'];
      print(resIp);
      return resIp;
    
    }else{
      return 'Not Valid Ip';
    }
  }
}