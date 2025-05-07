class Book {
  final int? id;
  final String? isbn;
  final String? title;
  final String? author;
 
  Book({
    this.title,
    this.author,
    this.id, this.isbn
  });

  @override
  String toString() {
    return 'Book(title: $title, author: $author)';
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      author: json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
    };
  }
}