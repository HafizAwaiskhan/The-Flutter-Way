import 'package:flutter/material.dart';
import 'app_strings.dart';
import 'app_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final TextEditingController billAmountController = TextEditingController();
  final TipCalculatorLogic logic = TipCalculatorLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appStrings['appTitle']!),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(appStrings['billAmount']!),
              TextField(
                keyboardType: TextInputType.number,
                controller: billAmountController,
                onChanged: (value) {
                  setState(() {
                    logic.billAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              const Padding(padding:EdgeInsets.symmetric(vertical: 20.0)),
              Text('${appStrings['selectTipPercentage']} ${logic.tipPercentage.toStringAsFixed(0)}%'),
              Slider(
                value: logic.tipPercentage,
                min: 0,
                max: 30,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    logic.tipPercentage = value;
                  });
                },
              ),
              const Padding(padding:EdgeInsets.symmetric(vertical: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(appStrings['tip']!),
                  Text(logic.calculateTipAmount().toStringAsFixed(2)),
                ],
              ),
              const Padding(padding:EdgeInsets.symmetric(vertical: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(appStrings['total']!),
                  Text(logic.calculateTotalAmount().toStringAsFixed(2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
