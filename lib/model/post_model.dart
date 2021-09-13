class PostModel {
  int userId, id;
  String title, body;

  PostModel({this.userId, this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"] ?? 0,
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      body: json["body"] ?? '',
    );
  }
}
