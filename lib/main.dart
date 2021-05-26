import 'package:clean_books/presentation/views/book_detail/book_detail_screen.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: BookDetailScreen(),
    );
  }
}
