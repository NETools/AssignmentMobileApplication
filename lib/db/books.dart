class Book {
  Book({required this.characters});
  List<dynamic> characters;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(characters: json['characters']);
  }
}
