class UserModel {
  String? author;
  String? body;
  String? postedAt;
  String? id;

  UserModel({this.author, this.body, this.postedAt, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    body = json['body'];
    postedAt = json['posted_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = author;
    data['body'] = body;
    data['posted_at'] = postedAt;
    data['id'] = id;
    return data;
  }
}