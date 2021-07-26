import 'package:bfproperty/constants/size_config.dart';
import 'package:flutter/material.dart';

class FloatingWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String txt;
  final Function onPressed;
  FloatingWidget({
    Key key,
    this.leadingIcon,
    this.txt,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: getProportionateScreenWidth(150),
      child: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          onPressed();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        heroTag: null,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 105,
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
