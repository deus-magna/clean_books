import 'package:equatable/equatable.dart';

class Book extends Equatable {
  Book({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });

  final String status;
  final int code;
  final int total;
  final List<Datum> data;

  @override
  List<Object?> get props => [status, code, total, data];
}

class Datum extends Equatable {
  Datum({
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.isbn,
    required this.image,
    required this.published,
    required this.publisher,
  });

  final String title;
  final String author;
  final String genre;
  final String description;
  final String isbn;
  final String image;
  final DateTime published;
  final String publisher;

  @override
  List<Object?> get props =>
      [title, author, genre, description, isbn, image, published, publisher];
}
