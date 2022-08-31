import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/widgets/action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'actions_row.dart';

class BookDetailDesktop extends StatelessWidget {
  final Book book;
  final VoidCallback onPressed;

  const BookDetailDesktop({
    Key? key,
    required this.book,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookImage(size),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                _buildBookTitle(),
                SizedBox(height: 5),
                _buildBookAuthor(),
                SizedBox(height: 30),
                _buildActions(),
                SizedBox(height: 30),
                _buildDescription()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(icon: Icons.star_border_rounded, isInverted: true),
        ActionButton(icon: Icons.mode_comment_outlined, isInverted: true),
        ActionButton(icon: Icons.ios_share, isInverted: true),
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
    if (kIsWeb) {
      return Container(
        margin: const EdgeInsets.all(20),
        height: size.height * 0.33,
        width: size.width * 0.5,
        child: Image(image: AssetImage('assets/img/portada.jpg')),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image(
          image: NetworkImage(book.data.first.image),
          height: size.height * 0.33,
        ),
      );
    }
  }

  Widget _buildDescription() {
    return Column(
      children: [
        SizedBox(height: 20),
        _buildDescriptionHeader(),
        SizedBox(height: 20),
        Text(
          book.data.first.description,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDescriptionHeader() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.width < 840) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descripción',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionsRow(onPressed: onPressed),
              ],
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Descripción',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ActionsRow(onPressed: onPressed),
          ],
        );
      }
    });
  }
}
