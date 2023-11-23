import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:future_builder/model/bot_api.dart';

class BotModelDs {

   

  static Future <List<BotApi>> getallpost () async {
    List<BotApi> receivelist = [];
    http.Response res = await http.get(Uri.parse('https://64a016efed3c41bdd7a6fbaf.mockapi.io/bottweet'));
    if(res.statusCode == 200){
      List parseList = jsonDecode(res.body);

      parseList.forEach((element) {

        receivelist.add(BotApi.fromJson(element));
    
      });

      return receivelist;
    }
    
    else{
     return receivelist;
    }
  }
}