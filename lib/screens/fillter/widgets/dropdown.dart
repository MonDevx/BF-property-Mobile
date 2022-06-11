import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  const dropdown({Key key}) : super(key: key);

  @override
  _dropdownState createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  int _ratingController;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: _ratingController,
      items: [1, 2, 3, 4, 5]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Rating'),
      onChanged: (value) {
        setState(() {
          _ratingController = value;
        });
      },
    );
  }
}
