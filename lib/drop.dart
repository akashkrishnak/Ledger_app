import 'package:flutter/material.dart';
import 'details.dart';

class drop extends StatefulWidget {
  static String dropdownValue="Food";
  @override
  State<drop> createState() => dropState();
}

class dropState extends State<drop> {
  @override
  String dropdownValue = 'Food';
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.amber, fontSize: 20),
      underline: Container(
        height: 2,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          drop.dropdownValue=dropdownValue;
        });
      },
      items: <String>[
        'Food',
        'Transport',
        'Entertainment',
        'Bills',
        'Medicine',
        'Other'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
