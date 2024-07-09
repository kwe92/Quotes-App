import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/extended_change_notifier.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/services.dart';

class QuotesViewModel extends ExtendedChangeNotifier {
  List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  final QuotesRepository _repo;

  // TODO: try injecting the singleton and getting ride of the repo
  QuotesViewModel(this._repo) {
    getQuotes();
  }

  Future<void> getQuotes() async {
    try {
      setBusy(true);
      _quotes = await _repo.getQuotes();
      setBusy(false);

      debugPrint("quotes: $quotes");
    } catch (err, _) {
      debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

      toastService.showSnackBar(err.toString());
    }
  }
}
