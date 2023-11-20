import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator_flutter/models/simple_calculator_model.dart';
import 'package:tip_calculator_flutter/views/bottom_navigation_view.dart';
import 'package:tip_calculator_flutter/views/simple_calculator_view.dart';
import 'package:tip_calculator_flutter/views/tip_calculator_view.dart';
import 'package:tip_calculator_flutter/helper_classes/toast_helper.dart';
import 'helper_classes/app_strings.dart';
import 'logics/tip_calculator_logic.dart';
import 'models/tip_calculator_model.dart';
import 'views/grocery_list_view.dart';
import 'helper_classes/text_styles.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SimpleCalculatorModel>(
            create: (context) => SimpleCalculatorModel()),
        ChangeNotifierProvider<TipCalculatorModel>(
            create: (context) => TipCalculatorModel()),
        // Provide the TipCalculatorModel
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CustomApp());
  }
}

class CustomApp extends StatelessWidget {
  CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Flutter Home"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            // Center horizontally
            children: <Widget>[
              _buildNavigationButton(appStrings['simpleCalculator']!, context),
              _buildNavigationButton(appStrings['tipCalculator']!, context),
              _buildNavigationButton(appStrings['listGridView']!, context),
              _buildNavigationButton(
                  appStrings['bottomNavigationView']!, context),
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

  Widget _buildNavigationButton(String operator, BuildContext context) {
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

  void handleButtonClick(String operator, BuildContext context) {
    // Handle button click logic here
    ToastHelper.showToast(context, operator);
    navigateToNewScreen(context, operator);
  }

  void navigateToNewScreen(BuildContext context, String operator) {
    Map<String, Widget> screenMap = {
      "Simple Calculator": const CalculatorScreen(),
      "Tip Calculator": const TipCalculator(),
      "Grocery List View": const GroceryListView(),
      "Bottom Navigation View": const BottomNavigation()
      // Add other screens as needed
    };

    Widget selectedScreen = screenMap[operator] ??
        Container(); // Default to an empty Container if the operator is not found

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => selectedScreen,
      ),
    );
  }
}
