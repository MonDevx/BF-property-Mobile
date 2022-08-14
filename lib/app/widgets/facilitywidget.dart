import 'package:flutter/material.dart';

class FacilityWidget extends StatelessWidget {
  final IconData iconData;
  final String text;

  const FacilityWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
       color: Color(0xff000000).withAlpha(28),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: themeData.iconTheme.color,
              size: 28,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                text,
           style: themeData.textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
    );
  }
}