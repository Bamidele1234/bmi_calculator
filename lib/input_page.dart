import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Define Universal variables
  double brd = 20.0, mrg = 8.0;
  Color myColor = const Color(0xFF1D1E33);

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
                    child: ReusableCard(mrg: mrg, myColor: myColor, brd: brd),
                  ),
                  Expanded(
                    child: ReusableCard(mrg: mrg, myColor: myColor, brd: brd),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(mrg: mrg, myColor: myColor, brd: brd),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child:
                          ReusableCard(mrg: mrg, myColor: myColor, brd: brd)),
                  Expanded(
                      child: ReusableCard(mrg: mrg, myColor: myColor, brd: brd))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
