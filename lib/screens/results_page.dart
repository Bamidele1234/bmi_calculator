import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.bmiValue,
      required this.bmiResult,
      required this.bmiAdvice,
      Key? key})
      : super(key: key);

  final String bmiValue;
  final String bmiResult;
  final String bmiAdvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('RESULTS')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ReusableCard(
                mrg: kmrg,
                myColor: kactiveColor,
                brd: kbrd,
                cardChild: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(bmiResult, style: kmyCalculatedCondition),
                        Text(bmiValue, style: kmyCalculatedSize),
                        Text(bmiAdvice,
                            style: kmyAdvice, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ReusableCard(
                mrg: kmrg,
                myColor: kbtnColor,
                brd: kbrd,
                onPressed: () {
                  /// To navigate back to the previous screen
                  Navigator.pop(context);
                },
                cardChild: const Center(
                  child: Text('RECALCULATE', style: kmyBottomButtonTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
