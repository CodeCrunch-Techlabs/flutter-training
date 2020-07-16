class BookStore {
  final int id;
  final String name;
  final String photo;

  BookStore({this.id, this.name, this.photo});

  factory BookStore.fromJson(Map<String, dynamic> json) {
    return BookStore(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }

}