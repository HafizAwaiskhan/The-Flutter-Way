import 'package:flutter/material.dart';

class TipCalculatorModel extends ChangeNotifier {
  double billAmount = 0.0;
  double percentage = 0.0;
  double tipResult = 0.0;
  double totalAmount = 0.0;

  void setValues(double billAmount, double percentage, double tipResult,
      double totalAmount) {
    this.billAmount = billAmount;
    this.percentage = percentage;
    this.tipResult = tipResult;
    this.totalAmount = totalAmount;
    notifyListeners();
  }
}
