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
  Gender? selectedGender;

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
                    child: ReusableCard(
                      mrg: mrg,
                      myColor: selectedGender == Gender.male
                          ? activeColor
                          : inactiveColor,
                      brd: brd,
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: const CardContent(
                          gender: 'MALE', icon: FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      mrg: mrg,
                      myColor: selectedGender == Gender.female
                          ? activeColor
                          : inactiveColor,
                      brd: brd,
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: const CardContent(
                          gender: 'FEMALE', icon: FontAwesomeIcons.venus),
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
