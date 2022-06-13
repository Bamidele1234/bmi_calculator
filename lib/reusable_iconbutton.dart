import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, this.myIcon}) : super(key: key);

  final IconData? myIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(myIcon),
      constraints: const BoxConstraints.tightFor(width: 55, height: 55),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kbrd)),
      fillColor: kfillColor,
      onPressed: () {},
    );
  }
}
