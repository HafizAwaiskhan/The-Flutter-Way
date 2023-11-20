import 'package:flutter/material.dart';
import 'package:tip_calculator_flutter/views/grocery_list_view.dart';
import 'package:tip_calculator_flutter/views/simple_calculator_view.dart';
import 'package:tip_calculator_flutter/views/tip_calculator_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  // Define your pages/screens
  final List<Widget> _pages = [
    const CalculatorScreen(),
    const TipCalculator(),
    const GroceryListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Simple Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: 'Tip Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List / Grid',
          ),
        ],
      ),
    );
  }
}
