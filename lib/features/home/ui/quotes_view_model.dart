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

  QuotesViewModel(this._repo, this._toastService);

  Future<bool> getQuotes([bool shouldNotify = false]) async {
    // try {
    _quotes = await _repo.getQuotes();

    debugPrint("quotes: $quotes");

    if (shouldNotify) notifyListeners();

    return true;
    // } catch (err, _) {
    //   debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

    //   _toastService.showSnackBar(err.toString());

    //   return false;
    // }
  }

  void showErrorMessage(String err) {
    _toastService.showSnackBar(err);
  }

  bool isCompleteSnapshot(AsyncSnapshot snapshot) {
    return snapshot.connectionState == ConnectionState.done;
  }

  bool snapshotHasError(AsyncSnapshot snapshot) {
    debugPrint("snapshotHasError: ${snapshot.hasError}");
    return snapshot.hasError;
  }
}
