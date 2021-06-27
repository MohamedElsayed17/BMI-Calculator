import 'package:bmi_calculator/modules/02-bmi_result_screen/bmi_result_screen.dart';
import 'package:bmi_calculator/shared/components/components.dart';
import 'package:bmi_calculator/styles/colors.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool isMale = true;
  int height = 180;
  int weight = 74;
  int age = 21;
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 8.0, left: 16.0, right: 8.0),
                  child: buildGender(
                      onPressed: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      icon: Icons.male,
                      data: 'MALE',
                      active: isMale),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 8.0, left: 0.0, right: 16.0),
                  child: buildGender(
                      onPressed: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      icon: Icons.female,
                      data: 'FEMALE',
                      active: !isMale),
                )),
              ],
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                color: activeBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'HEIGHT',
                        style: inActiveTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: activeLargeTextStyle,
                          ),
                          Text(
                            'cm',
                            style: inActiveTextStyle,
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        child: Slider(
                            value: height.toDouble(),
                            min: 140.0,
                            max: 210.0,
                            activeColor: pinkColor,
                            inactiveColor: inActiveColor,
                            onChanged: (value) {
                              setState(() {
                                height = value.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 8.0, bottom: 8.0),
                    child: buildHeightAndAgeContainer(
                        addHeroTag: 'weight_add',
                        minusHeroTag: 'weight_minus',
                        text: 'WEIGHT',
                        value: '$weight',
                        addFunction: () {
                          setState(() {
                            if (weight < 200) weight++;
                          });
                        },
                        minusFunction: () {
                          setState(() {
                            if (weight > 30) weight--;
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                    child: buildHeightAndAgeContainer(
                        addHeroTag: 'age_add',
                        minusHeroTag: 'age_minus',
                        text: 'AGE',
                        value: '$age',
                        addFunction: () {
                          setState(() {
                            if (age < 140) age++;
                          });
                        },
                        minusFunction: () {
                          setState(() {
                            if (age > 1) age--;
                          });
                        }),
                  ),
                ),
              ],
            )),
            buildDefaultButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (c) =>
                              BMIResultScreen(weight: weight, height: height)));
                },
                text: 'calculate your bmi')
          ],
        ),
      ),
    );
  }
}
