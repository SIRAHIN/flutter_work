import 'dart:convert';

import 'package:bottweet/model/bot_model.dart';
import 'package:http/http.dart' as http;

class BotTweetDataSource{

  //static Future<List?> getAllpost(){}

 static Future<List<BotModel>> getAllpost() async {

  

    List<BotModel> recevingData = [];
    

    http.Response res = await http.get(Uri.parse("https://64a016efed3c41bdd7a6fbaf.mockapi.io/bottweet"));
    if(res.statusCode == 200){
      List parsedata = jsonDecode(res.body);
      
      parsedata.forEach((data) { 
        
        // BotModel sendingData = ;
        
       
        recevingData.add(BotModel.fromjson(data));
        
      });
    }
    else{
      throw Exception('Failed to load data');
    }


    return recevingData;    
  }


  


  static PostBotTweet(BotModel botModel) async{
    
    // BotModel? botModel;

    http.Response response = await http.post(Uri.parse("https://64a016efed3c41bdd7a6fbaf.mockapi.io/bottweet"),
    body: botModel.tojson()
    );

    // if(response.statusCode == 200){
    //   return true;
    // }
    // return false;
  }
}