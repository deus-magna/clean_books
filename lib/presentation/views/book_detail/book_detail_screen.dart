import 'package:clean_books/core/framework/colors.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/cubit/book_detail/book_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection_container.dart';

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => _getRandomBook(context),
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => sl<BookdetailCubit>(),
        child: BlocBuilder<BookdetailCubit, BookDetailState>(
          builder: (context, state) {
            if (state is BookdetailInitial) {
              _getRandomBook(context);
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is BookDetailLoading) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is BookDetaiLoaded) {
              final book = state.book;
              return _buildBookDetail(size, book, context);
            } else if (state is BookDetailError) {
              return Container(
                child: Center(
                  child: Text(state.message),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Text('Error'),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _getRandomBook(BuildContext context) {
    print('get random book');
    final bookDetailCubit = context.read<BookdetailCubit>();
    bookDetailCubit.getNewRandomBook();
  }

  Widget _buildBookDetail(Size size, Book book, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: NetworkImage(book.data.first.image),
            height: size.height * 0.33,
          ),
        ),
        SizedBox(height: 20),
        Text(
          book.data.first.title,
          textAlign: TextAlign.center,
        ),
        Text(
          book.data.first.author,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionButton(icon: Icons.star_border_rounded),
            ActionButton(icon: Icons.mode_comment_outlined),
            ActionButton(icon: Icons.ios_share),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Description'),
                    ElevatedButton(
                        onPressed: () => _getRandomBook(context),
                        child: Text('Next')),
                  ],
                ),
                SizedBox(height: 20),
                Text(book.data.first.description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;

  const ActionButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: secondary,
      ),
    );
  }
}
