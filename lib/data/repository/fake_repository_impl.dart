import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/data/datasources/book_detail/books_remote_datasource.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/repositories/books_repository.dart';
import 'package:dartz/dartz.dart';

class FakeRepositpryImpl implements BooksRepository {
  final BooksRemoteDataSource remoteDataSource;

  FakeRepositpryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Book>> getRandomBook() async {
    try {
      await remoteDataSource.requestRandomBook();
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
