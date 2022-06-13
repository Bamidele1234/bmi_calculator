import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1020),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0D1020),
        ),
      ),
      initialRoute: 'Screen1',
      routes: {
        'Screen1': (context) => const InputPage(),
        'Screen2': (context) => const ResultsPage()
      },
    );
  }
}
