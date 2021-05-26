import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;

  const BookDetail({
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
        _buildBookAuthor(),
        SizedBox(height: 20),
        _buildActions(),
        SizedBox(height: 20),
        _BottomCard(onPressed: onPressed, book: book),
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
    );
  }

  Widget _buildBookTitle() {
    return Text(
      book.data.first.title,
      textAlign: TextAlign.center,
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

class _BottomCard extends StatelessWidget {
  const _BottomCard({
    Key? key,
    required this.onPressed,
    required this.book,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildDescriptionHeader(),
            SizedBox(height: 20),
            Text(book.data.first.description),
          ],
        ),
      ),
    );
  }

  Row _buildDescriptionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Description'),
        ElevatedButton(onPressed: onPressed, child: Text('Next')),
      ],
    );
  }
}
