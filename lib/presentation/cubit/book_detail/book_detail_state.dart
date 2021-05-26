part of 'book_detail_cubit.dart';

abstract class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object> get props => [];
}

class BookdetailInitial extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetaiLoaded extends BookDetailState {
  final Book book;

  BookDetaiLoaded(this.book);

  @override
  List<Object> get props => [book];
}

class BookDetailError extends BookDetailState {
  final String message;

  BookDetailError(this.message);

  @override
  List<Object> get props => [message];
}
