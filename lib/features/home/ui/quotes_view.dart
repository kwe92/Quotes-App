import 'package:flutter/material.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';
import 'package:mvvm_example_app/features/home/ui/widgets/quote_card.dart';
import 'package:mvvm_example_app/features/home/ui/widgets/shimmer_quote_card.dart';
import 'package:provider/provider.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    // read view model without watching state
    final viewModel = context.read<QuotesViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xff222222),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xff222222),
        title: const Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<void>(
        // call long running initialization logic
        future: viewModel.initialize(),
        builder: (context, snapshot) {
          // add Consumer to watch view model state | start rebuilding from here as to not rebuild FutureBuilder
          return Consumer<QuotesViewModel>(builder: (context, QuotesViewModel viewModel, _) {
            return Padding(
              padding: const EdgeInsets.only(left: 48, right: 16),
              child: RefreshIndicator(
                backgroundColor: const Color(0xff2b2c2f),
                color: Colors.blue,
                onRefresh: () async {
                  await viewModel.getQuotes();
                },
                child: !viewModel.snapshotHasError(snapshot) || viewModel.quotes.length > 1
                    ? ListView.separated(
                        itemCount: viewModel.quotes.isNotEmpty ? viewModel.quotes.length : 6,
                        itemBuilder: (context, i) {
                          return viewModel.isCompleteSnapshot(snapshot) && !viewModel.isBusy
                              ? QuoteCard(quote: viewModel.quotes[i])
                              : const ShimmerQuoteCard();
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 8),
                      )
                    : const Center(
                        child: Text(
                          " There was an issue retrieving your data please check your connection.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ),
            );
          });
        },
      ),
    );
  }
}
