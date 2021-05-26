import 'package:clean_books/core/framework/colors.dart';
import 'package:flutter/material.dart';

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
            onPressed: () => print('Request new book'),
            icon: Icon(
              Icons.refresh_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: NetworkImage('http://placeimg.com/480/640/any'),
            height: size.height * 0.33,
          ),
          SizedBox(height: 20),
          Text(
            'Nombre del libro',
            textAlign: TextAlign.center,
          ),
          Text(
            'Autor del libro',
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
                  Text('Description'),
                  SizedBox(height: 20),
                  Text('Pues es un libro muy bonito ejejeje\n\n\n\n\n'),
                ],
              ),
            ),
          ),
        ],
      ),
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
