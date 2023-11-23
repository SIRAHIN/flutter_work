class BotApi {
  String? author;
  String? body;
  String? postedAt;
  String? id;

  BotApi({this.author, this.body, this.postedAt, this.id});

  BotApi.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    body = json['body'];
    postedAt = json['posted_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['body'] = this.body;
    data['posted_at'] = this.postedAt;
    data['id'] = this.id;
    return data;
  }
}