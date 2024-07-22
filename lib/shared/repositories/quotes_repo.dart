import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';

class QuotesRepository with ChangeNotifier {
  List<Quote> _quotes = [];

  List<Quote> get quotes => _quotes;

  final QuotesService _quotesService;

  static QuotesRepository? _singleton;

  QuotesRepository._internal(this._quotesService);

  factory QuotesRepository(QuotesService quotesService) {
    _singleton ??= QuotesRepository._internal(quotesService);

    return _singleton!;
  }

  Future<void> getQuotes() async {
    final data = await _quotesService.getQuotes();

    _quotes = [
      for (Map<String, dynamic> quote in data) Quote.fromMap(quote),
    ];

    debugPrint("QuotesRepository - quotes: $_quotes");

    notifyListeners();
  }
}
