import 'dart:convert';

class Quote {
  final String author;
  final String quote;

  const Quote({
    required this.author,
    required this.quote,
  });

  factory Quote.fromJson(String json) => Quote.fromMap(jsonDecode(json));

  factory Quote.fromMap(Map<String, dynamic> data) => Quote(
        author: data["a"],
        quote: data["q"],
      );

  @override
  String toString() => 'Quote(author: $author, quote: $quote)';
}
