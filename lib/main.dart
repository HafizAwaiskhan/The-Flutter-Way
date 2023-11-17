import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator_flutter/models/simple_calculator_model.dart';
import 'package:tip_calculator_flutter/simple_calculator.dart';
import 'package:tip_calculator_flutter/tip_calculator.dart';
import 'package:tip_calculator_flutter/toast_helper.dart';
import 'app_strings.dart';
import 'tip_calculator_logic.dart';
import 'grocery_list_view.dart';
import 'text_styles.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SimpleCalculatorModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomApp()
    );
  }
}

class CustomApp extends StatelessWidget {
  CustomApp({super.key});

  final TextEditingController billAmountController = TextEditingController();
  final TipCalculatorLogic logic = TipCalculatorLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Flutter Home"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: <Widget>[
              _buildNavigationButton(appStrings['simpleCalculator']!, context),
              _buildNavigationButton(appStrings['tipCalculator']!, context),
              _buildNavigationButton(appStrings['listGridView']!, context),
            ],
          ),
        ),
      ),
    );
  }

  static AppBar buildAppBar(String appTitle) {
    return AppBar(
      title: Text(
        appTitle,
        style: CustomTextStyles.textStyle24Bold,
      ),
      centerTitle: true,
    );
  }

  Widget _buildNavigationButton(String operator , BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        handleButtonClick(operator, context);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0), // Adjust padding as needed
      ),
      child: Text(operator),
    );
  }

  void handleButtonClick(String operator , BuildContext context) {
    // Handle button click logic here
    ToastHelper.showToast(context, operator);
    navigateToNewScreen(context, operator);
  }

  void navigateToNewScreen(BuildContext context, String operator) {
    Map<String, Widget> screenMap = {
      "Simple Calculator": const CalculatorScreen(),
      "Tip Calculator": TipCalculatorBody(billAmountController: billAmountController, logic: logic),
      "Grocery List View": const GroceryListView(),
      // Add other screens as needed
    };

    Widget selectedScreen = screenMap[operator] ?? Container(); // Default to an empty Container if the operator is not found

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => selectedScreen,
      ),
    );
  }

}
