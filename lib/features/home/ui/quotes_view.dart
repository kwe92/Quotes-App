import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_example_app/features/home/ui/quotes_view_model.dart';
import 'package:provider/provider.dart';

// TODO: Outline what you did to stream line the process

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuotesViewModel>();

    if (!viewModel.isInitialized) viewModel.initialize();
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
      body: Padding(
        padding: const EdgeInsets.only(left: 48, right: 16),
        child: RefreshIndicator(
          backgroundColor: const Color(0xff2b2c2f),
          color: Colors.blue,
          onRefresh: () async {
            await viewModel.getQuotes(true);
          },
          child: ListView.separated(
            itemCount: viewModel.quotes.length,
            itemBuilder: (context, i) {
              return Container(
                width: double.maxFinite,
                height: 200,
                padding: const EdgeInsets.only(left: 12, top: 16),
                decoration: const BoxDecoration(
                  color: Color(0xff2b2c2f),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: SvgPicture.asset(
                        "/Users/kwe/flutter-projects/MVVM-Example-App/mvvm_example_app/assets/left-quotation-mark.svg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        viewModel.quotes[i].quote,
                        maxLines: 5,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 24, bottom: 24),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          viewModel.quotes[i].author,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        ),
      ),
    );
  }
}

bool isCompleteSnapshot(AsyncSnapshot snapshot) {
  return snapshot.connectionState == ConnectionState.done;
}
