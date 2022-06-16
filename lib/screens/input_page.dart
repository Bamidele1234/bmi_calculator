import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/card_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/btm_crd_cnt.dart';
import 'package:bmi_calculator/calculator_brain.dart';

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
  int weight = 45;
  int age = 20;

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

  displaySb(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(ksnackBar(message));

  ksnackBar(String message) => SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15.0),
        ),
      );

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
          //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        subText: const Text(
                          'kg',
                          style: kmyTextStyle,
                        ),
                        onIncrease: () {
                          setState(() {
                            weight >= 1200
                                ? displaySb(
                                    'Your weight cannot be greater than 1200kg')
                                : incWeight();
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            weight <= 1
                                ? displaySb(
                                    'Your weight cannot be less than 1kg')
                                : decWeight();
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
                            age >= 150
                                ? displaySb(
                                    'Your age cannot be greater than 150')
                                : incAge();
                          });
                        },
                        onDecrease: () {
                          setState(() {
                            age <= 1
                                ? displaySb('Your age cannot be less than 1')
                                : decAge();
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
                cardChild: const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Center(
                    child: Text('CALCULATE', style: kmyBottomButtonTextStyle),
                  ),
                ),
                onPressed: () {
                  var brain = CalculatorBrain(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiValue: brain.getBmi(),
                        bmiResult: brain.getResult(),
                        bmiAdvice: brain.getAdvice(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
