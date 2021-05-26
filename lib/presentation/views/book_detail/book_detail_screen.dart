import 'package:clean_books/core/framework/colors.dart';
import 'package:clean_books/presentation/views/book_detail/book_detail_view.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _buildAppBar(context),
      body: BookDetailView(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => print('Show more actions'),
          icon: Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
