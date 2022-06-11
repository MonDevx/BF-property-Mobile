/*
* File : Single Grid Item
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinglePageItem extends StatelessWidget {
  final String title, icon;
  final String navigation;

  const SinglePageItem({
    Key key,
    @required this.title,
    @required this.navigation,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    String assetName;
    if (icon == null) {
      assetName = 'assets/icons/rocket-outline.png';
    } else {
      assetName = icon;
    }

    Widget iconWidget = Image.asset(
      assetName,
      color: themeData.colorScheme.primary,
      width: 36,
      height: 36,
    );
    return InkWell(
      onTap: () {
        Get.toNamed('/' + this.navigation);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 0.25, color: themeData.colorScheme.surface),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              iconWidget,
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  title,
                  style: themeData.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
