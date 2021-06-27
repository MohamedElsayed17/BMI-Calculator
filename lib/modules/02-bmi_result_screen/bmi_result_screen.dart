import 'package:bmi_calculator/models/bmi_Cclculator_Brain.dart';
import 'package:bmi_calculator/modules/01-bmi_calculator_screen/bmi_calculator_screen.dart';
import 'package:bmi_calculator/shared/components/components.dart';
import 'package:bmi_calculator/styles/colors.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int weight;
  final int height;

  const BMIResultScreen({required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    BMICalculatorBrain bmiCalculatorBrain =
        BMICalculatorBrain(weight: weight, height: height / 100.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: activeSmallTextStyle,
        ),
        backgroundColor: appBackgroundColor,
        leading: Icon(Icons.notes),
      ),
      body: Container(
        color: appBackgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Your Result',
                style: resultTextStyle,
              ),
            ),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              child: Container(
                color: activeBackgroundColor,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${bmiCalculatorBrain.getResultType()}',
                      style: bmiCalculatorBrain.getResultType() == 'NORMAL'
                          ? normalResultTextStyle
                          : underAndOverWeightResultTextStyle,
                    ),
                    Text(
                      '${bmiCalculatorBrain.calculateBMIValue()}',
                      style: resultValueTextStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          '${bmiCalculatorBrain.getResultType()} BMI Range: ',
                          style: inActiveTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${bmiCalculatorBrain.getRange()}',
                          style: activeSmallTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        '${bmiCalculatorBrain.getResultSentence()}',
                        style: activeSmallTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )),
            buildDefaultButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => BMICalculatorScreen()));
                },
                text: 'recalculate your bmi')
          ],
        ),
      ),
    );
  }
}
