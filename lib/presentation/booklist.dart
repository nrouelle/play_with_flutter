import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:testformvalidation/data/book_repository_impl.dart';
import 'package:testformvalidation/domain/models/book.dart';
import 'package:testformvalidation/domain/usecases/get_all_books.dart';
import 'package:testformvalidation/presentation/add_book_widget.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  late GetAllBooks _getAllBooks;
  
  var booksList = List<Book>.empty(growable: true);
  Future<void> loadBooksList({required Logger logger}) async {
    final repo = BookRepositoryImpl('assets/files/books.json');
    _getAllBooks = GetAllBooks(bookRepository: repo);

    setState(() {
      _getAllBooks.call().then((value) {
        setState(() {
          booksList = value;
          logger.d('Charging books list');
        });
      }).catchError((error) {
        logger.e('Error loading books: $error');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    
    loadBooksList(logger: Provider.of<Logger>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    final logger = Provider.of<Logger>(context, listen: false);
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
                  title: Text(booksList[index].title ?? 'Unknown Title'),
                  subtitle: Text(booksList[index].author ?? 'Unknown Author'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddBookWidget(title: 'Add Book',)))
              .then((_) => loadBooksList(logger: logger)); // Reload the book list after adding a new book
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}