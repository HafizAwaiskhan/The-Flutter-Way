import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator_flutter/helper_classes/text_styles.dart';
import 'package:tip_calculator_flutter/models/tip_calculator_model.dart';
import '../main.dart';
import '../logics/tip_calculator_logic.dart';
import '../helper_classes/app_strings.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculator> {
  TextEditingController _billAmountController = TextEditingController();
  TipCalculatorLogic _tipLogic = TipCalculatorLogic();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from CalculatorData
    final tipCalculatorData = Provider.of<TipCalculatorModel>(context, listen: false);
    _billAmountController = TextEditingController(text: tipCalculatorData.billAmount.toString());
    _tipLogic.tipPercentage = tipCalculatorData.percentage;
    // Set the initial values for tip and total amounts
    // _tipLogic.billAmount = double.tryParse(_billAmountController.text) ?? 0.0;
    _tipLogic.calculateTipAmount(); // Update tip amount
    _tipLogic.calculateTotalAmount(); // Update total amount
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomApp.buildAppBar("Tip Calculator"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                appStrings['billAmount']!,
                style: CustomTextStyles.textStyle20SemiBold,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _billAmountController,
                onChanged: (value) {
                  setState(() {
                    _tipLogic.billAmount = double.tryParse(value) ?? 0.0;
                  });
                  saveDataInModel();
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
              Text(
                '${appStrings['selectTipPercentage']} ${_tipLogic.tipPercentage.toStringAsFixed(0)}%',
                style: CustomTextStyles.textStyle20SemiBold,
              ),
              Slider(
                value: _tipLogic.tipPercentage,
                min: 0,
                max: 30,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    _tipLogic.tipPercentage = value;
                  });
                  saveDataInModel();
                },
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      appStrings['tip']!,
                      style: CustomTextStyles.textStyle24Bold,
                    ),
                  ),
                  Text(
                    _tipLogic.calculateTipAmount().toStringAsFixed(2),
                    style: CustomTextStyles.textStyle24Bold,
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      appStrings['total']!,
                      style: CustomTextStyles.textStyle24Bold,
                    ),
                  ),
                  Text(
                    _tipLogic.calculateTotalAmount().toStringAsFixed(2),
                    style: CustomTextStyles.textStyle24Bold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDataInModel() {
    final tipCalculatorModel = Provider.of<TipCalculatorModel>(context, listen: false);
    double billAmount = double.tryParse(_billAmountController.text) ?? 0.0;
    double tipAmount = _tipLogic.calculateTipAmount();
    double totalAmount = _tipLogic.calculateTotalAmount();

    tipCalculatorModel.setValues(billAmount, _tipLogic.tipPercentage, tipAmount, totalAmount);
  }
}

