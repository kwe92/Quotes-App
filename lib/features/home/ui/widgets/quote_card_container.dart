import 'package:flutter/material.dart';

class QuoteCardContainer extends StatelessWidget {
  final Widget child;
  const QuoteCardContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
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
      child: child,
    );
  }
}
