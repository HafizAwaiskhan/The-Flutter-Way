import 'package:flutter/material.dart';

class GroceryListView extends StatefulWidget {
  const GroceryListView({super.key});

  @override
  _GroceryListViewState createState() => _GroceryListViewState();
}

class _GroceryListViewState extends State<GroceryListView> {
  final TextEditingController _listSizeController = TextEditingController();
  List<String> groceryList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _listSizeController,
            decoration: const InputDecoration(labelText: 'Enter list size'),
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final int listSize = int.tryParse(_listSizeController.text) ?? 0;
            setState(() {
              groceryList = List.generate(
                listSize,
                    (index) => 'Item ${index + 1}',
              );
            });
          },
          child: const Text('Create List'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: groceryList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.star),
                title: Text(groceryList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}