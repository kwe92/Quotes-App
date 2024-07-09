import 'package:mocktail/mocktail.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';

import 'test_data.dart';

class MockQuotesService extends Mock implements QuotesService {}

class MockQuotesRepository extends Mock implements QuotesRepository {}

class TestHelperMocks {
  TestHelperMocks._();

  static MockQuotesService getQuotesServiceMock() {
    // instantiate mock
    final MockQuotesService service = MockQuotesService();

    // mock functions
    when(() => service.getQuotes()).thenAnswer((_) => Future.value(testQuotes));

    when(() => service.quotes).thenReturn(testQuotes);

    // return mock
    return service;
  }

  static MockQuotesRepository getQuotesRepositoryMock() {
    // instantiate mock
    final MockQuotesRepository repo = MockQuotesRepository();

    // mock functions
    when(() => repo.getQuotes()).thenAnswer((_) => Future.value(testQuotes));

    // return mock
    return repo;
  }
}
