import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_example_app/features/home/ui/widgets/quote_card_container.dart';
import 'package:mvvm_example_app/shared/widgets/shimmerWidgets/shimmer_text.dart';
import 'package:mvvm_example_app/shared/widgets/shimmerWidgets/shimmer_wrapper.dart';

class ShimmerQuoteCard extends StatelessWidget {
  const ShimmerQuoteCard({super.key});
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ShimmerLines(),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 24, bottom: 24),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ShimmerText(width: 80),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerLines extends StatelessWidget {
  final Color? baseColor;

  final Color? highlightColor;

  final HighlightTilt? tilt;

  const ShimmerLines({
    this.baseColor,
    this.highlightColor,
    this.tilt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerText(
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
        const SizedBox(height: 16),
        ShimmerText(
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
        const SizedBox(height: 16),
        ShimmerText(
          width: 180,
          highlightTilt: tilt ?? HighlightTilt.none,
          baseColor: baseColor,
          highlightColor: highlightColor,
        ),
      ],
    );
  }
}
