import 'package:flutter/material.dart';
import 'package:tip_calculator_flutter/text_styles.dart';
import 'button_styles.dart';

class GroceryListView extends StatefulWidget {
  const GroceryListView({super.key});

  @override
  _GroceryListViewState createState() => _GroceryListViewState();
}

class _GroceryListViewState extends State<GroceryListView> {
  final TextEditingController _listSizeController = TextEditingController();
  List<String> groceryList = [];
  bool isGrid = false;
  String buttonText = "Generate List";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyanAccent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _listSizeController,
              decoration: const InputDecoration(labelText: 'Enter list size'),
              keyboardType: TextInputType.number,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: buildButton(),
              ),
            ],
          ),
          Expanded(
            child: isGrid ? buildGridView() : buildListView(),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildButton() {
    return ElevatedButton(
      onPressed: () {
        final int listSize = int.tryParse(_listSizeController.text) ?? 0;
        setState(() {
          groceryList = generateGroceryList(listSize);

          // Toggle between list and grid layouts
          isGrid = !isGrid;
          // Change button text accordingly
          buttonText = isGrid ? "Switch to List view" : "Switch to Grid layout";
        });
      },
      style: ButtonStyles.primaryButtonStyle(Colors.green),
      child: Text(buttonText),
    );
  }

  /// create separate grocery list

  List<String> generateGroceryList(int listSize) {
    return List.generate(
      listSize,
          (index) => 'Item ${index + 1}',
    );
  }

  /// this will build the List view Widget

  Widget buildListView() {
    return ListView.builder(
      itemCount: groceryList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
          ),
          color: Colors.white, // White background color
          child: ListTile(
            title: Text(groceryList[index],
                style: CustomTextStyles.textStyle24Bold),
            trailing: const Icon(Icons.star),
            subtitle: Text("This is our description ${groceryList[index]}",
                style: CustomTextStyles.textStyle14Regular),
          ),
        );
      },
    );
  }


  /// this will build the Grid view widget

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Set the number of columns here
      ),
      itemCount: groceryList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.star, size: 48.0, color: Colors.blue),
              Text(groceryList[index],
                  style: CustomTextStyles.textStyle24Bold),
              Text(
                  "This is our description ${groceryList[index]}",
                  textAlign: TextAlign.center,
              style: CustomTextStyles.textStyle14Regular
              ),
            ],
          ),
        );
      },
    );
  }
}
