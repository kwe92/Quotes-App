import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_example_app/shared/extended_change_notifier.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';

//! use get it service locator for client in real project, global variables are not the best choice but do work

final _client = http.Client();

class NetworkError extends Error {
  final String? message;

  NetworkError([this.message]);

  @override
  String toString() => message ?? "there was an issue retrieving your data.";
}

class QuotesService extends ExtendedChangeNotifier {
  List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes;

  static final _singleton = QuotesService._internal();

  QuotesService._internal();

  factory QuotesService() => _singleton;

  Future<void> getQuotes() async {
    final response = await _client.get(
      Uri.parse("https://zenquotes.io/api/quotes"),
    );

    if (response.statusCode > 205) {
      throw NetworkError();
    }

    final List<dynamic> responseBody = jsonDecode(response.body);

    final List<Map<String, dynamic>> data = List.from(responseBody);

    _quotes = [
      for (Map<String, dynamic> quote in data) Quote.fromMap(quote),
    ];

    notifyListeners();
  }
}
