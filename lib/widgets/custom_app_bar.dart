import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = ThemeController.to;
    SizeConfig().init(context);
    return AppBar(
      automaticallyImplyLeading:
          ModalRoute.of(context).settings.name != "/signin",
      title: Text(title),
      flexibleSpace: Visibility(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(35, 56, 135, 0.80),
                Color.fromRGBO(8, 172, 145, 0.80)
              ],
              stops: [0.3, 1.04],
            ),
          ),
        ),
        visible: themeController.currentTheme != "dark",
      ),
    );
  }
}
