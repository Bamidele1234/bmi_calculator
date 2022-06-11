import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'card_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Define Universal variables
  double brd = 20.0, mrg = 8.0;
  Color activeColor = const Color(0xFF1D1E33);
  Color inactiveColor = const Color(0xFF111328);
  Color btnColor = const Color(0xFFEB1555);
  double bch = 70;

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
                        log("The male card was pressed");
                      },
                      child: ReusableCard(
                        mrg: mrg,
                        myColor: inactiveColor,
                        brd: brd,
                        cardChild: const CardContent(
                            gender: 'MALE', icon: FontAwesomeIcons.mars),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        log('The female card was pressed');
                      },
                      child: ReusableCard(
                        mrg: mrg,
                        myColor: inactiveColor,
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
