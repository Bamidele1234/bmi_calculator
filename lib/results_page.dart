import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('RESULTS')),
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
                cardChild: Expanded(
                  child: Column(
                    children: const [
                      Center(
                        child: Text('The center Text'),
                      ),
                    ],
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
                  child: Text('Recalculate', style: kmyBottomButtonTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
