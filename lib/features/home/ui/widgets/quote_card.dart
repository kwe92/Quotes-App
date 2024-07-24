import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_example_app/features/home/ui/widgets/quote_card_container.dart';
import 'package:mvvm_example_app/shared/models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({required this.quote, super.key});

  @override
  Widget build(BuildContext context) {
    return QuoteCardContainer(
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
              quote.quote,
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
                quote.author,
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
  }
}
