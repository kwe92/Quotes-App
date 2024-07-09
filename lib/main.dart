import 'package:flutter/material.dart';
import 'package:mvvm_example_app/app/constants.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';
import 'package:mvvm_example_app/shared/repositories/quotes_repo.dart';
import 'package:mvvm_example_app/shared/services/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      scaffoldMessengerKey: WidgetKey.rootScaffoldMessengerKey,
      home: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => QuotesViewModel(QuotesRepository(quotesService), toastService),
        builder: (context, _) => const QuotesView(),
      );
}
