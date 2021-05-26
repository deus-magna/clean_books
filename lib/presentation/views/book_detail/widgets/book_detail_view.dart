import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:clean_books/presentation/views/book_detail/widgets/book_detail_desktop.dart';
import 'package:clean_books/presentation/views/book_detail/widgets/book_detail_mobile.dart';
import 'package:clean_books/presentation/widgets/error_message.dart';
import 'package:clean_books/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../injection_container.dart';

class BookDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => sl<BookDetailCubit>(),
      child: BlocBuilder<BookDetailCubit, BookDetailState>(
        builder: (context, state) {
          return _buildContentFromState(context, state, size);
        },
      ),
    );
  }

  Widget _buildContentFromState(
    BuildContext context,
    BookDetailState state,
    Size size,
  ) {
    if (state is BookdetailInitial) {
      _getRandomBook(context);
      return LoadingIndicator();
    } else if (state is BookDetailLoading) {
      return LoadingIndicator();
    } else if (state is BookDetaiLoaded) {
      final book = state.book;
      return ScreenTypeLayout(
        mobile: BookDetailMobile(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        desktop: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
        tablet: BookDetailDesktop(
          book: book,
          onPressed: () => _getRandomBook(context, book: book),
        ),
      );
    } else if (state is BookDetailError) {
      return ErrorMessage(
        message: state.message,
        onPressed: () => _getRandomBook(context),
      );
    } else {
      return Container(
        child: Center(
          child: Text('Error'),
        ),
      );
    }
  }

  void _getRandomBook(BuildContext context, {Book? book}) async {
    if (book != null) {
      await evictImage(book.data.first.image);
    }

    final bookDetailCubit = context.read<BookDetailCubit>();
    bookDetailCubit.getNewRandomBook();
  }

  Future<void> evictImage(String imageURL) async {
    final NetworkImage provider = NetworkImage(imageURL);
    await provider.evict();
  }
}
