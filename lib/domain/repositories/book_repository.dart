import 'package:testformvalidation/domain/models/book.dart';

abstract class BookRepository {
  Future<List<Book>> getAllBooks();
  // Future<Book> getBookById(String id);
  // Future<void> addBook(Book book);
  // Future<void> updateBook(Book book);
  // Future<void> deleteBook(String id);
}