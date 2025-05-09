import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testformvalidation/domain/models/book.dart';
import 'package:testformvalidation/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final String _filePath;

  BookRepositoryImpl(this._filePath);

  @override
  Future<List<Book>> getAllBooks() async {
    final String jsonString = await rootBundle.loadString(_filePath);
    final List<dynamic> data = jsonDecode(jsonString);
    
    return data.map((json) => Book.fromJson(json)).toList();
  }
}