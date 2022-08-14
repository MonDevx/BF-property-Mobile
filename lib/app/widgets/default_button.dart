import 'package:flutter/material.dart';

import '../core/utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    required this.press,
    this.color,
  }) : super(key: key);
  final String? text;
  final Function press;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: RaisedButton(
        onPressed:()=> press(),
        color: color,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
