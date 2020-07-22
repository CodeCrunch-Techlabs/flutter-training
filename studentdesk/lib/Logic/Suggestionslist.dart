class Book {
  final String name;

  Book({this.name});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'] as String,
    );
  }
}