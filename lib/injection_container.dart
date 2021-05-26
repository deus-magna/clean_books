import 'package:clean_books/data/datasources/book_detail/books_remote_datasource.dart';
import 'package:clean_books/data/repository/books_repository_impl.dart';
import 'package:clean_books/domain/repositories/books_repository.dart';
import 'package:clean_books/domain/usecases/book_detail/get_random_book.dart';
import 'package:clean_books/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initBookDetail();
}

Future<void> initBookDetail() async {
  //! Features - BookDetail
  // Cubit
  sl.registerFactory(() => BookDetailCubit(sl()));

  // use cases
  sl.registerLazySingleton(() => GetRandomBook(sl()));

  // Repository
  sl.registerLazySingleton<BooksRepository>(() => BooksRepositpryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<BooksRemoteDataSource>(
      () => BooksRemoteDataSourceImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
