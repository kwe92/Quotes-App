import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/extended_change_notifier.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';

class QuotesViewModel extends ExtendedChangeNotifier {
  List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  final QuotesRepository _repo;
  final ToastService _toastService;

  // TODO: try injecting the singleton and getting ride of the repo

  // TODO: refactor - read: https://stackoverflow.com/questions/54549235/dart-await-on-constructor

  QuotesViewModel(this._repo, this._toastService) {
    getQuotes();
  }

  Future<void> getQuotes() async {
    try {
      setBusy(true);
      _quotes = await _repo.getQuotes();
      setBusy(false);

      debugPrint("quotes: $quotes");
    } catch (err, _) {
      setBusy(false);
      debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

      _toastService.showSnackBar(err.toString());
    }
  }
}
