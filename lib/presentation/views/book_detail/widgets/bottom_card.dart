import 'package:clean_books/core/framework/colors.dart';
import 'package:clean_books/domain/entities/book.dart';
import 'package:flutter/material.dart';

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

  Row _buildDescriptionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Description',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: secondary,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: onPressed,
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 21,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: buttonBackground,
                        child: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          onPressed: onPressed,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
