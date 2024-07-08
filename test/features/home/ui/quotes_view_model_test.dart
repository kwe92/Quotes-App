import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';

import '../../../setup/test_data.dart';
import '../../../setup/test_helper_mocks.dart';

void main() {
  group(
    "QuotesViewModel -",
    () {
      QuotesViewModel getModel() => QuotesViewModel();
      test("when model is created, then a call to the zen quotes api is made.", () {
        // Arrange

        final mockQuotesService = TestHelperMocks.getQuotesServiceMock();

        var model = getModel();

        // Act

        model.getQuotes();

        var actual = model.quotes;

        var expected = testQuotes;

        print(actual);

        // Assert

        // expect(actual, expected);
      });
    },
  );
}
