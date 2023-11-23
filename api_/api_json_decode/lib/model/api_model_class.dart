class apiModelClass{
  int? userId;
  int? id;
  String? title;
  String? body;

  apiModelClass(Map<dynamic, dynamic> data){
    userId = data["userId"];
    id = data[ "id"];
    title = data["title"];
    body = data["body"];
  }

}