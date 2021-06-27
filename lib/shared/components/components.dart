import 'package:bmi_calculator/styles/colors.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

Widget buildGender({
  required Function() onPressed,
  required IconData icon,
  required String data,
  bool active = false,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      color: defaultBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 54,
            color: active ? activeColor : inActiveColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            data,
            style: active ? activeSmallTextStyle : inActiveTextStyle,
          ),
        ],
      ),
    ),
  );
}

Widget buildHeightAndAgeContainer({
  required String text,
  required String value,
  required Function() addFunction,
  required Function() minusFunction,
  required String addHeroTag,
  required String minusHeroTag,
}) {
  return Container(
    color: activeBackgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: inActiveTextStyle,
        ),
        Text(
          value,
          style: activeLargeTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: minusFunction,
              heroTag: minusHeroTag,
              child: Icon(Icons.remove),
              backgroundColor: defaultBackgroundColor,
              mini: true,
            ),
            FloatingActionButton(
              onPressed: addFunction,
              heroTag: addHeroTag,
              child: Icon(Icons.add),
              backgroundColor: defaultBackgroundColor,
              mini: true,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildDefaultButton(
    {required Function() onPressed,
    required String text,
    bool isUpperCase = true,
    Color buttonColor = pinkColor}) {
  return Container(
    height: 48,
    width: double.infinity,
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: activeSmallTextStyle,
      ),
      color: buttonColor,
    ),
  );
}
