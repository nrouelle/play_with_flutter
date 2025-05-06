import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testformvalidation/models/book.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  var booksList = List<Book>.empty(growable: true);
  Future<void> loadBooksList() async {
    final String jsonString = await rootBundle.loadString('assets/files/books.json');
    final List<dynamic> data = jsonDecode(jsonString);
    setState(() {
      booksList = data.map((json) => Book.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadBooksList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books List'),
      ),
      body: booksList.isEmpty
          ? const Center(child: Text('No books available'))
          : ListView.builder(
              itemCount: booksList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(booksList[index].title),
                  subtitle: Text(booksList[index].author),
                );
              },
            ),
    );
  }
}