import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import '../../../setup/test_data.dart';
import '../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "QuotesViewModel -",
    () {
      QuotesViewModel getModel(QuotesRepository repo) => QuotesViewModel(repo);
      test("when model is created, then a call to the zen quotes api is made.", () async {
        // Arrange
        final mockQuotesRepo = TestHelperMocks.getQuotesRepositoryMock();

        final model = getModel(mockQuotesRepo);

        // Act
        await model.getQuotes();

        var actual = model.quotes;

        var expected = testQuotes;

        // Assert
        expect(actual, expected);

        verify(() => mockQuotesRepo.getQuotes()).called(2);
      });
    },
  );
}
