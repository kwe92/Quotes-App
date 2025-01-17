import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/extended_change_notifier.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';

class QuotesViewModel extends ExtendedChangeNotifier {
  final QuotesRepository _repo;

  final ToastService _toastService;

  List<Quote> get quotes => _repo.quotes;

  QuotesViewModel(this._repo, this._toastService);

  Future<void> initialize() async {
    // error handling defered to FutureBuilder
    await _repo.getQuotes();
  }

  Future<void> getQuotes() async {
    try {
      setBusy(true);

      await _repo.getQuotes();

      setBusy(false);
    } catch (err, _) {
      setBusy(false);

      debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

      _toastService.showSnackBar(
        err.toString(),
        Colors.red,
      );
    }
  }

  bool isCompleteSnapshot(AsyncSnapshot snapshot) {
    return snapshot.connectionState == ConnectionState.done;
  }

  bool snapshotHasError(AsyncSnapshot snapshot) {
    debugPrint("snapshotHasError: ${snapshot.hasError}");

    if (snapshot.hasError) {
      // required to show a snackbar after widget build finishes
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          _toastService.showSnackBar(
            snapshot.error.toString(),
            Colors.red,
          );
        },
      );
    }

    return snapshot.hasError;
  }
}
