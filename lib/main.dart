import 'package:bmi_calculator/modules/02-bmi_result_screen/bmi_result_screen.dart';
import 'package:flutter/material.dart';

import 'modules/01-bmi_calculator_screen/bmi_calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculatorScreen(),
    );
  }
}
