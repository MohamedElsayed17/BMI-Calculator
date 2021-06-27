import 'dart:math';

class BMICalculatorBrain {
  final int weight;
  final double height;

  double _bmi = 0.0;

  BMICalculatorBrain({required this.weight, required this.height}) {
    _bmi = weight / pow(height, 2);
  }

  String calculateBMIValue() {
    return _bmi.toStringAsFixed(1);
  }

  String getResultType() {
    if (_bmi >= 25) {
      print('OVERWEIGHT');
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      print('NORMAL');
      return 'NORMAL';
    } else {
      print('UNDERWEIGHT');
      return 'UNDERWEIGHT';
    }
  }

  String getResultSentence() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat more!';
    }
  }

  String getRange() {
    if (_bmi >= 25) {
      return '25-30 or more kg/m2';
    } else if (_bmi > 18.5) {
      return '18.5 - 25 kg/m2';
    } else {
      return '18.5 or less kg/m2';
    }
  }
}
