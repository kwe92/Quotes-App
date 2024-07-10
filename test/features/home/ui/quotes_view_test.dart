import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';

import '../../../setup/test_helper_mocks.dart';

void main() {
  testWidgets('quotes view ...', (tester) async {
    // Arrange - setup

    var mockRepo = TestHelperMocks.getQuotesRepositoryMock();

    var mockToastService = TestHelperMocks.getToastServiceMock();

    var viewModel = QuotesViewModel(mockRepo, mockToastService);

    // print(viewModel.quotes);

    await pumpWidget(
      tester,
      const QuotesView(),
      viewModel,
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Act

    final finder = find.textContaining("Anne");

    // Assert - result

    expect(finder, findsOneWidget);
  });
}
