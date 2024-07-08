import 'package:flutter/material.dart';
import 'package:mvvm_example_app/app/constants.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view.dart';

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
  Widget build(BuildContext context) => const QuotesView();
}
