import 'package:flutter/material.dart';
import 'package:tip_calculator_flutter/toast_helper.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  String _operator = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOperatorButton('+'),
                _buildOperatorButton('-'),
                _buildOperatorButton('*'),
                _buildOperatorButton('/'),
              ],
            ),
            SizedBox(height: 4.0),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 4.0),
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: InputDecoration(labelText: 'Result'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _operator = operator;
        });
      },
      child: Text(operator),
    );
  }

  void _calculate() {
    String num1Text = _num1Controller.text;
    String num2Text = _num2Controller.text;

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

    if (_operator == '') {
      ToastHelper.showToast(context, 'Please Select some operator!!');
    } else {
      switch (_operator) {
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
      _resultController.text = result.toString();
    }
  }
}