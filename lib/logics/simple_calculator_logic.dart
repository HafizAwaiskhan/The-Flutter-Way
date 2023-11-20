import 'package:flutter/cupertino.dart';
import '../helper_classes/app_strings.dart';
import '../helper_classes/toast_helper.dart';

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
      ToastHelper.showToast(context, appStrings['enterFirstNumber']!);
      return;
    }
    if (num2Text.isEmpty) {
      ToastHelper.showToast(context, appStrings['enterSecondNumber']!);
      return;
    }

    double num1 = double.tryParse(num1Text) ?? 0.0;
    double num2 = double.tryParse(num2Text) ?? 0.0;
    double result;

    if (operator == '') {
      ToastHelper.showToast(context, appStrings['selectOperator']!);
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
