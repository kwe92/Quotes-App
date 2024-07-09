import 'package:mvvm_example_app/shared/models/quote.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';

class QuotesRepository {
  final QuotesService _quotesService;

  QuotesRepository(this._quotesService);

  Future<List<Quote>> getQuotes() async => await _quotesService.getQuotes();
}
