import 'package:flutter/cupertino.dart';
import 'package:tip_calculator_flutter/toast_helper.dart';


class TipCalculatorLogic {
  double billAmount = 0.0;
  double tipPercentage = 0.0;

  double calculateTipAmount() {
    return (billAmount * tipPercentage) / 100;
  }

  double calculateTotalAmount() {
    return billAmount + calculateTipAmount();
  }
}

class SimpleCalculatorLogic {
  void calculateSimpleLogic({
    required TextEditingController num1Controller,
    required TextEditingController num2Controller,
    required TextEditingController resultController,
    required BuildContext context,
    required String operator,
  }) {
    String num1Text = num1Controller.text;
    String num2Text = num2Controller.text;

    // Check for empty values
    if (num1Text.isEmpty) {
      ToastHelper.showToast(context, 'Please Enter 1st value');
      return;
    }
    if (num2Text.isEmpty) {
      ToastHelper.showToast(context, 'Please Enter 2nd value');
      return;
    }

    double num1 = double.tryParse(num1Text) ?? 0.0;
    double num2 = double.tryParse(num2Text) ?? 0.0;
    double result;

    if (operator == '') {
      ToastHelper.showToast(context, 'Please Select some operator!!');
    } else {
      switch (operator) {
        case "+":
          result = num1 + num2;
          break;
        case "-":
          result = num1 - num2;
          break;
        case "*":
          result = num1 * num2;
          break;
        case "/":
          result = num2 != 0 ? num1 / num2 : double.infinity;
          break;
        default:
          result = 0.0;
      }
      resultController.text = result.toString();
    }
  }
}
