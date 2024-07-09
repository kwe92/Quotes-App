import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';
import '../../../setup/test_data.dart';
import '../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "QuotesViewModel -",
    () {
      QuotesViewModel getModel(QuotesRepository repo, ToastService toastService) => QuotesViewModel(repo, toastService);
      test("when model is created and getQuotes function called, then qoutes propery is updated", () async {
        // Arrange
        final mockQuotesRepo = TestHelperMocks.getQuotesRepositoryMock();

        var mockToastService = MockToastService();

        final model = getModel(mockQuotesRepo, mockToastService);

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
