import 'dart:convert';
enum Status { initial, loading, success, fail }
class BookModel {
  String title;
  String author;
  String audio;
  String image;

  BookModel({
    required this.title,
    required this.author,
    required this.audio,
    required this.image,
  });

  factory BookModel.fromRawJson(String str) => BookModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    title: json["title"],
    author: json["author"],
    audio: json["audio"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "audio": audio,
    "image": image,
  };
}
