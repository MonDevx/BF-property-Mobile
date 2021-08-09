import 'package:bfproperty/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Fillter extends StatefulWidget {
  // fillter({Key? key}) : super(key: key);

  @override
  _FillterState createState() => _FillterState();
}

class _FillterState extends State<Fillter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar("ค้นหา"),
      ),
      body: Text("test"),
    );
  }
}
