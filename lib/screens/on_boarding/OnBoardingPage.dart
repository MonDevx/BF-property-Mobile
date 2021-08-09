import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'components/body.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
