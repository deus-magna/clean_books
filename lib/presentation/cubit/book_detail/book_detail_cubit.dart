import 'package:bloc/bloc.dart';
import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/usecases/get_random_book.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'book_detail_state.dart';

class BookdetailCubit extends Cubit<BookDetailState> {
  final GetRandomBook getRandomBook;

  BookdetailCubit(this.getRandomBook) : super(BookdetailInitial());

  void getNewRandomBook() async {
    emit(BookDetailLoading());
    final failureOrBook = await getRandomBook();
    emit(_eitherLoadedOrErrorState(failureOrBook));
  }

  BookDetailState _eitherLoadedOrErrorState(
      Either<Failure, Book> failureOrPokemonList) {
    return failureOrPokemonList.fold(
        (failure) => BookDetalError(_mapFailureToMessage(failure)),
        (randomBook) => BookDetaiLoaded(randomBook));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Unexpected error';
    }
  }
}
