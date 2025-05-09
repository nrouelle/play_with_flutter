import 'package:testformvalidation/domain/models/book.dart';
import 'package:testformvalidation/domain/repositories/book_repository.dart';

class GetAllBooks {
  final BookRepository _bookRepository;

  GetAllBooks({required BookRepository bookRepository}) : _bookRepository = bookRepository;

  Future<List<Book>> call() async {
    final list = await _bookRepository.getAllBooks();
    return list;
  }
}