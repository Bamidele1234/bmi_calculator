import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'card_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'btm_crd_cnt.dart';

/// Enum types for gender
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  void decWeight() {
    weight--;
  }

  void incWeight() {
    weight++;
  }

  void incAge() {
    age++;
  }

  void decAge() {
    age--;
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
          children: [
            Expanded(
              flex: kcardFlex,
              child: Row(
                children: [
                  Expanded(
                    // 0xFF1D1E33
                    child: ReusableCard(
                      mrg: kmrg,
                      myColor: selectedGender == Gender.male
                          ? kactiveColor
                          : kinactiveColor,
                      brd: kbrd,
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
                      mrg: kmrg,
                      myColor: selectedGender == Gender.female
                          ? kactiveColor
                          : kinactiveColor,
                      brd: kbrd,
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
              flex: kcardFlex,
              child: ReusableCard(
                mrg: kmrg,
                myColor: kactiveColor,
                brd: kbrd,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kmyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kmyNumStyle,
                        ),
                        const Text(
                          'cm',
                          style: kmyTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kinactiveTrackColor,
                        activeTrackColor: Colors.white,
                        thumbColor: kbtnColor,
                        overlayColor: koverlayColor,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: kenabledThumbRadius),
                        overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: kOverlayRadius),
                      ),
                      child: Slider.adaptive(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: kcardFlex,
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      mrg: kmrg,
                      myColor: kactiveColor,
                      brd: kbrd,
                      cardChild: BottomCardContent(
                        title: 'Weight',
                        value: weight,
                        onIncrease: () {
                          setState(() {
                            incWeight();
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            decWeight();
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      mrg: kmrg,
                      myColor: kactiveColor,
                      brd: kbrd,
                      cardChild: BottomCardContent(
                        title: 'Age',
                        value: age,
                        onIncrease: () {
                          setState(() {
                            incAge();
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            decAge();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: kbuttonFlex,
              child: ReusableCard(
                mrg: kmrg,
                myColor: kbtnColor,
                brd: kbrd,
                cardChild: const Center(
                  child: Text('CALCULATE',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                      )),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'Screen2');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
