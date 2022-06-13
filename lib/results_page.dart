import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Results Page'),
      ),
      body: const Center(
        child: Text(
          'This is the second screen',
          style: kmyTextStyle,
        ),
      ),
    );
  }
}
