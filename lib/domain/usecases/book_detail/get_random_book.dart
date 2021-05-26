import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/repositories/books_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomBook {
  final BooksRepository booksRepository;

  GetRandomBook(this.booksRepository);

  Future<Either<Failure, Book>> call() async {
    return booksRepository.getRandomBook();
  }
}
