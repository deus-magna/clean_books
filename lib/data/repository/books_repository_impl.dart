import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/data/datasources/books_remote_datasource.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/repositories/books_repository.dart';
import 'package:dartz/dartz.dart';

class BooksRepositpryImpl implements BooksRepository {
  final BooksRemoteDataSource remoteDataSource;

  BooksRepositpryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Book>> getRandomBook() async {
    try {
      final book = await remoteDataSource.requestRandomBook();
      return Right(book);
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
