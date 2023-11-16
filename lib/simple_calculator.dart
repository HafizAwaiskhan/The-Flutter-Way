import 'package:flutter/material.dart';
import 'package:tip_calculator_flutter/app_strings.dart';
import 'package:tip_calculator_flutter/tip_calculator_logic.dart';
import 'package:tip_calculator_flutter/toast_helper.dart';

import 'main.dart';

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
    return Scaffold(
      appBar: CustomApp.buildAppBar("Simple Calculator"),
        body: Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: appStrings['enterFirstNumber']!),
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
              decoration: InputDecoration(labelText: appStrings['enterSecondNumber']!),
            ),
            SizedBox(height: 4.0),
            ElevatedButton(
              onPressed: _calculate,
              child: Text(appStrings['calculate']!),
            ),
            SizedBox(height: 4.0),
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: InputDecoration(labelText: appStrings['result']!),
            ),
          ],
        ),
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
    // Create an instance of SimpleCalculatorLogic
    SimpleCalculatorLogic calculatorLogic = SimpleCalculatorLogic();

    // Call the calculateSimpleLogic method
    calculatorLogic.calculateSimpleLogic(
      num1Controller: _num1Controller,
      num2Controller: _num2Controller,
      resultController: _resultController,
      context: context,
      operator: _operator,
    );
  }
}