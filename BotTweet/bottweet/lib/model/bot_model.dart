

class BotModel {
  String? author;
  String? body;
  String? posted;
  int? id;


  BotModel.fromjson(Map json){
    author = json['author'];
    body = json['body'];
    posted = json['posted_at']?.substring(0,19); 
    id = int.parse(json['id']);

  }

  BotModel({required this.author, required this.body,});

  Map <dynamic , dynamic> tojson (){
    Map <dynamic , dynamic> data = {};
    data = {
      "author" : "$author",
      "body" : "$body"
    };
    return data ;
  }




 
}