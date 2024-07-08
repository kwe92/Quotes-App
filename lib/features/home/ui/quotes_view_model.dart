import 'package:flutter/material.dart';
import 'package:mvvm_example_app/shared/extended_change_notifier.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/services/services.dart';

class QuotesViewModel extends ExtendedChangeNotifier {
  List<Quote> get quotes => quotesService.quotes;

  QuotesViewModel() {
    getQuotes();
  }

  Future<void> getQuotes() async {
    try {
      setBusy(true);
      await quotesService.getQuotes();
      setBusy(false);

      debugPrint("quotes: $quotes");
    } catch (err, _) {
      debugPrint("Error - QuotesViewModel: getQuotes: ${err.toString()}");

      toastService.showSnackBar(err.toString());
    }
  }
}
