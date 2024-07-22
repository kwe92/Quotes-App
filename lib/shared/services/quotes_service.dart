import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkError extends Error {
  final String message;

  NetworkError([this.message = "there was an issue retrieving your data."]);

  @override
  String toString() => message;
}

class QuotesService {
  final http.Client _client;

  static QuotesService? _singleton;

  QuotesService._internal(this._client);

  factory QuotesService(http.Client client) {
    _singleton ??= QuotesService._internal(client);

    return _singleton!;
  }

  Future<List<Map<String, dynamic>>> getQuotes() async {
    // Simulate long delay
    await Future.delayed(const Duration(seconds: 2));

    final response = await _client.get(
      Uri.parse("https://zenquotes.io/api/quotes"),
    );

    if (response.statusCode > 205) {
      throw NetworkError();
    }

    final List<dynamic> responseBody = jsonDecode(response.body);

    final List<Map<String, dynamic>> data = List.from(responseBody);

    return data;
  }
}
