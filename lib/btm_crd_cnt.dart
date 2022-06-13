import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_iconbutton.dart';

class BottomCardContent extends StatelessWidget {
  const BottomCardContent({
    Key? key,
    required this.value,
    required this.title,
    this.onIncrease,
    this.onDecrease,
    this.spacing = 15,
  }) : super(key: key);

  final int value;
  final String title;
  final double spacing;
  final Function()? onIncrease;
  final Function()? onDecrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title.toUpperCase(),
          style: kmyTextStyle,
        ),
        Text(
          value.toString(),
          style: kmyNumStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              myIcon: FontAwesomeIcons.minus,
              onPressed: onDecrease,
            ),
            SizedBox(
              width: spacing,
            ),
            RoundIconButton(
              myIcon: FontAwesomeIcons.plus,
              onPressed: onIncrease,
            ),
          ],
        ),
      ],
    );
  }
}
