import 'package:flutter/material.dart';

class SimpleCalculatorModel extends ChangeNotifier {
  double num1 = 0.0;
  double num2 = 0.0;
  double result = 0.0;

  void setValues(double num1, double num2, double result) {
    this.num1 = num1;
    this.num2 = num2;
    this.result = result;
    notifyListeners();
  }
}
