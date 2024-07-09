import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_app/app/constants.dart';
import 'package:mvvm_example_app/shared/services/toast_service.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/quotes_service.dart';

import 'test_data.dart';

class MockQuotesService extends Mock implements QuotesService {}

class MockQuotesRepository extends Mock implements QuotesRepository {}

class MockToastService extends Mock implements ToastService {}

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

  static MockToastService getToastServiceMock() {
    // instantiate mock
    final MockToastService service = MockToastService();

    // mock functions
    when(() => service.showSnackBar(any())).thenReturn(null);

    // return mock
    return service;
  }
}

Future<void> pumpWidget<T extends ChangeNotifier>(WidgetTester tester, Widget view, [T? viewModel]) async {
  await tester.pumpWidget(
    TestingWrapper(
      view: view,
      viewModel: viewModel,
    ),
  );
}

// Future<void> pumpWidget<T extends ChangeNotifier>(WidgetTester tester, Widget view, [T? viewModel]) async {
//   await tester.pumpWidget(
//     TestingWrapper(
//       view: view,
//       viewModel: viewModel,
//     ),
//   );
// }

class TestingWrapper<T extends ChangeNotifier> extends StatelessWidget {
  final Widget view;
  final T? viewModel;

  const TestingWrapper({
    required this.view,
    this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: WidgetKey.rootScaffoldMessengerKey,
      home: viewModel != null
          ? ChangeNotifierProvider(
              create: (context) => viewModel,
              builder: (context, child) => view,
            )
          : view,
    );
  }
}
