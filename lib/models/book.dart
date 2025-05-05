class Book {
  String title;
  String author;
 
  Book({
    required this.title,
    required this.author,
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