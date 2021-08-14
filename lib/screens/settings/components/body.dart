import 'package:bfproperty/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'languagesetting.dart';
import 'themesetting.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Column(
          children: [
            LanguageSetting(),
            SizedBox(height: getProportionateScreenHeight(20)),
            ThemeSetting()
          ],
        ),
      ),
    );
  }
}




