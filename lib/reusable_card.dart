import 'package:flutter/material.dart';

/// A card that has its color, borderRadius ,margin specified
class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.mrg,
    required this.myColor,
    required this.brd,
    this.cardChild,
  }) : super(key: key);

  final double mrg;
  final Color myColor;
  final double brd;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(mrg),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(brd),
      ),
    );
  }
}
