import 'dart:convert';

import 'package:clean_books/domain/entities/book.dart';

BookModel bookFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookToJson(BookModel data) => json.encode(data.toJson());

class BookModel extends Book {
  BookModel({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  }) : super(status: status, code: code, total: total, data: data);

  final String status;
  final int code;
  final int total;
  final List<DatumModel> data;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        status: json["status"],
        code: json["code"],
        total: json["total"],
        data: List<DatumModel>.from(
            json["data"].map((x) => DatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumModel extends Datum {
  DatumModel({
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.isbn,
    required this.image,
    required this.published,
    required this.publisher,
  }) : super(
            title: title,
            author: author,
            genre: genre,
            description: description,
            isbn: isbn,
            image: image,
            published: published,
            publisher: publisher);

  final String title;
  final String author;
  final String genre;
  final String description;
  final String isbn;
  final String image;
  final DateTime published;
  final String publisher;

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        title: json["title"],
        author: json["author"],
        genre: json["genre"],
        description: json["description"],
        isbn: json["isbn"],
        image: json["image"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "author": author,
        "genre": genre,
        "description": description,
        "isbn": isbn,
        "image": image,
        "published":
            "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "publisher": publisher,
      };
}
