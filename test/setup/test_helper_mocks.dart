import 'package:mocktail/mocktail.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';

import 'test_data.dart';

class MockQuotesService extends Mock implements QuotesService {}

class TestHelperMocks {
  TestHelperMocks._();

  static MockQuotesService getQuotesServiceMock() {
    // instantiate mock service
    final MockQuotesService service = MockQuotesService();

    // mock functions
    when(() => service.getQuotes()).thenAnswer((_) => Future.value(testQuotes));

    when(() => service.quotes).thenReturn(testQuotes);

    // return mock service
    return service;
  }
}
