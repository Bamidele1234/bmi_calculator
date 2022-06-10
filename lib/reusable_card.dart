import 'package:flutter/material.dart';

/// A card that has its color, borderRadius ,margin specified
class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.mrg,
    required this.myColor,
    required this.brd,
  }) : super(key: key);

  final double mrg;
  final Color myColor;
  final double brd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(mrg),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(brd),
      ),
    );
  }
}
