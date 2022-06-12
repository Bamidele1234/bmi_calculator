import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    required this.icon,
    required this.gender,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: kmyTextStyle,
        ),
      ],
    );
  }
}
