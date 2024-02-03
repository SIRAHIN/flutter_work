import 'dart:convert';

import 'package:findip/model/ipinfomodel.dart';
import 'package:http/http.dart' as http;

class ip_info_detailes{

  IpInfoModel? infoModel; 
   Future<IpInfoModel> getDetailes  (String ipController) async {
    http.Response res = await http.get(Uri.parse("https://ipinfo.io/$ipController/geo"));
    if(res.statusCode==200){

      final body = jsonDecode(res.body);
      
      final decodedResponse = IpInfoModel.fromJson(body);
      
      return decodedResponse;

      //return jsonDecode(res.body);
    }
    return infoModel!;
  }
}