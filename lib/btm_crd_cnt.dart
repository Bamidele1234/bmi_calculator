import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_iconbutton.dart';

class BottomCardContent extends StatelessWidget {
  const BottomCardContent({
    Key? key,
    required this.weight,
  }) : super(key: key);

  final int weight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'WEIGHT',
          style: kmyTextStyle,
        ),
        Text(
          weight.toString(),
          style: kmyNumStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RoundIconButton(
              myIcon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(
              myIcon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
