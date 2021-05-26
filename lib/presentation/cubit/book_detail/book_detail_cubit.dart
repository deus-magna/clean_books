import 'package:bloc/bloc.dart';
import 'package:clean_books/core/errors/failure.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/domain/usecases/book_detail/get_random_book.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final GetRandomBook getRandomBook;

  BookDetailCubit(this.getRandomBook) : super(BookdetailInitial());

  void getNewRandomBook() async {
    emit(BookDetailLoading());
    ImageCache imageCache = ImageCache();
    imageCache.clear();
    final failureOrBook = await getRandomBook();
    emit(_eitherLoadedOrErrorState(failureOrBook));
  }

  BookDetailState _eitherLoadedOrErrorState(
      Either<Failure, Book> failureOrPokemonList) {
    return failureOrPokemonList.fold(
        (failure) => BookDetailError(_mapFailureToMessage(failure)),
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
