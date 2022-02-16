const List<Quote> quotes = [];

class Quote {
  final String greek;
  final String? english;
  final String author;

  Quote({required this.greek, this.english, required this.author});
}
