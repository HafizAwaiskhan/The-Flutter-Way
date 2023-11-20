import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator_flutter/helper_classes/app_strings.dart';
import '../logics/simple_calculator_logic.dart';
import '../main.dart';
import '../models/simple_calculator_model.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late TextEditingController _num1Controller = TextEditingController();
  late TextEditingController _num2Controller = TextEditingController();
  late TextEditingController _resultController = TextEditingController();
  String _operator = "";

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from CalculatorData
    final calculatorData =
        Provider.of<SimpleCalculatorModel>(context, listen: false);
    _num1Controller =
        TextEditingController(text: calculatorData.num1.toString());
    _num2Controller =
        TextEditingController(text: calculatorData.num2.toString());
    _resultController =
        TextEditingController(text: calculatorData.result.toString());
  }

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
                decoration:
                    InputDecoration(labelText: appStrings['enterFirstNumber']!),
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
                decoration: InputDecoration(
                    labelText: appStrings['enterSecondNumber']!),
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

    final simpleCalculatorModel =
        Provider.of<SimpleCalculatorModel>(context, listen: false);
    simpleCalculatorModel.setValues(
      double.parse(_num1Controller.text),
      double.parse(_num2Controller.text),
      double.parse(_resultController.text),
    );
  }
}
