import 'package:flutter/material.dart';
import 'package:tip_calculator_flutter/text_styles.dart';
import 'main.dart';
import 'tip_calculator_logic.dart';
import 'app_strings.dart';

class TipCalculatorBody extends StatelessWidget {
  final TextEditingController billAmountController;
  final TipCalculatorLogic logic;

  const TipCalculatorBody({super.key,
    required this.billAmountController,
    required this.logic,
  });

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
              controller: billAmountController,
              onChanged: (value) {
                logic.billAmount = double.tryParse(value) ?? 0.0;
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            Text(
              '${appStrings['selectTipPercentage']} ${logic.tipPercentage.toStringAsFixed(0)}%',
              style: CustomTextStyles.textStyle20SemiBold,
            ),
            Slider(
              value: logic.tipPercentage,
              min: 0,
              max: 30,
              divisions: 10,
              onChanged: (value) {
                logic.tipPercentage = value;
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
                  logic.calculateTipAmount().toStringAsFixed(2),
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
                  logic.calculateTotalAmount().toStringAsFixed(2),
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
}
