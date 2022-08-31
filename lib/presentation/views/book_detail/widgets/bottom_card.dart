import 'package:clean_books/domain/entities/book.dart';
import 'package:clean_books/presentation/views/book_detail/widgets/actions_row.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
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
        elevation: 8.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
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
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionHeader() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      final child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Descripción',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ActionsRow(onPressed: onPressed),
        ],
      );

      if (sizingInformation.screenSize.width < 320) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: child,
        );
      } else {
        return child;
      }
    });
  }
}
