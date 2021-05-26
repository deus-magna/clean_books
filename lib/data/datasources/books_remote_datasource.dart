import 'package:clean_books/core/errors/exceptions.dart';
import 'package:clean_books/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract class BooksRemoteDataSource {
  Future<BookModel> requestRandomBook();
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  final http.Client client;

  BooksRemoteDataSourceImpl(this.client);

  @override
  Future<BookModel> requestRandomBook() async {
    final url =
        Uri.parse('https://fakerapi.it/api/v1/books?_quantity=1&_locale=es_ES');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return bookFromJson(response.body);
    } else {
      throw ServerException();
    }
  }
}
