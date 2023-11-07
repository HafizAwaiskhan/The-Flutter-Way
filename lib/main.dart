import 'package:flutter/material.dart';
import 'app_strings.dart';
import 'app_logic.dart';
import 'grocery_list_view.dart';
import 'text_styles.dart';

void main() {
  runApp( MyApp());
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
      appBar: buildAppBar(),
      // body: TipCalculatorBody(billAmountController: billAmountController,logic: logic), // Use the GroceryListView here
      body: const GroceryListView(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        appStrings['appTitle']!,
        style: CustomTextStyles.textStyle24Bold,
      ),
      centerTitle: true,
    );
  }
}
