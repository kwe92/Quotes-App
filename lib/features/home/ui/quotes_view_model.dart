import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';

class QuotesViewModel extends ChangeNotifier {
  List<Quote> _quotes = [];

  bool _isInitialized = false;

  List<Quote> get quotes => _quotes;

  bool get isInitialized => _isInitialized;

  final QuotesRepository _repo;

  final ToastService _toastService;

  QuotesViewModel(this._repo, this._toastService);

  void initialize() {
    if (!isInitialized) {
      setInitialized(true);

      var future = getQuotes();

      future.then((isSuccessful) => isSuccessful ? refresh() : null);
    }

    debugPrint("QuotesViewModel has been initialized.");
  }

  Future<bool> getQuotes([bool shouldNotify = false]) async {
    try {
      _quotes = await _repo.getQuotes();

      debugPrint("quotes: $quotes");

      if (shouldNotify) notifyListeners();

      return true;
      // ignore: unused_catch_stack
    } catch (err, stackTrace) {
      debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

      // debugPrint("st: $st");

      _toastService.showSnackBar(err.toString());

      return false;
    }
  }

  void setInitialized(bool isInitialized) {
    _isInitialized = isInitialized;
  }

  void refresh() {
    notifyListeners();
    debugPrint("refresh called");
  }
}
