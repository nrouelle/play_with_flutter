import 'dart:convert';
import 'package:testformvalidation/domain/models/book.dart';

class BookDto extends Book {
  BookDto({
    super.id,
    super.title,
    super.author,
    super.isbn

  });

  factory BookDto.fromRawJson(String str) =>
    BookDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  factory BookDto.fromMap(Map<String, dynamic> json) => BookDto(
    id: json["id"],
    title: json["title"],
    author: json["author"],
    isbn: json["isbn"],);

    Map<String, dynamic> toMap() => {
      "id": id,
      "title": title,
      "author": author,
      "isbn": isbn,
    };
}