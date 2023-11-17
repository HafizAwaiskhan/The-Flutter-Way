import 'package:flutter/cupertino.dart';

class SimpleCalculatorModel extends ChangeNotifier {
  double num1 = 0.0;
  double num2 = 0.0;
  double result = 0.0;

  void setValues(double newNum1, double newNum2, double newResult) {
    num1 = newNum1;
    num2 = newNum2;
    result = newResult;
    notifyListeners();
  }
}