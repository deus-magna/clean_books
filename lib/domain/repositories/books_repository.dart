import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:dartz/dartz.dart';

abstract class BooksRepository {
  Future<Either<Failure, Book>> getRandomBook();
}
