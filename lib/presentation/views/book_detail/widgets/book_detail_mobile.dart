import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

import 'bottom_card.dart';

class BookDetailMobile extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;

  const BookDetailMobile({
    Key? key,
    required this.book,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBookImage(size),
        SizedBox(height: 20),
        _buildBookTitle(),
        SizedBox(height: 5),
        _buildBookAuthor(),
        SizedBox(height: 30),
        _buildActions(),
        SizedBox(height: 30),
        BottomCard(onPressed: onPressed, book: book),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(icon: Icons.star_border_rounded),
        ActionButton(icon: Icons.mode_comment_outlined),
        ActionButton(icon: Icons.ios_share),
      ],
    );
  }

  Widget _buildBookAuthor() {
    return Text(
      book.data.first.author,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildBookTitle() {
    return Text(
      book.data.first.title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBookImage(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        image: NetworkImage(book.data.first.image),
        height: size.height * 0.33,
      ),
    );
  }
}
