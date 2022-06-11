import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'card_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Define Universal variables
double brd = 20.0, mrg = 8.0, bch = 70;
const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);
const btnColor = Color(0xFFEB1555);

/// Enum types for gender
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  // TODO: Refactor this to use the ternary operator
  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == inactiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = inactiveColor;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    // 0xFF1D1E33
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                          log('The Male button is tapped');
                        });
                      },
                      child: ReusableCard(
                        mrg: mrg,
                        myColor:
                            maleCardColor, // TODO: Use the ternary operator here
                        brd: brd,
                        cardChild: const CardContent(
                            gender: 'MALE', icon: FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.female);

                          log('The female button is tapped');
                        });
                      },
                      child: ReusableCard(
                        mrg: mrg,
                        myColor:
                            femaleCardColor, // TODO: Don't forget here too ! 👌
                        brd: brd,
                        cardChild: const CardContent(
                            gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(mrg: mrg, myColor: activeColor, brd: brd),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          mrg: mrg, myColor: activeColor, brd: brd)),
                  Expanded(
                      child: ReusableCard(
                          mrg: mrg, myColor: activeColor, brd: brd))
                ],
              ),
            ),
            Container(
              color: btnColor,
              margin: const EdgeInsets.only(top: 10.0),
              height: bch,
            ),
          ],
        ),
      ),
    );
  }
}
