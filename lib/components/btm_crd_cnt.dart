import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_iconbutton.dart';

class BottomCardContent extends StatelessWidget {
  const BottomCardContent({
    Key? key,
    required this.value,
    required this.title,
    this.onIncrease,
    this.onDecrease,
    this.subText,
    this.spacing = 15,
  }) : super(key: key);

  final int value;
  final String title;
  final double spacing;
  final Text? subText;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: kmyNumStyle,
            ),
            // If the value of subtext is null return an unseen widget
            subText ?? const SizedBox.shrink()
          ],
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
