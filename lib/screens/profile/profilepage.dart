import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/get.dart';
import 'widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final ThemeController themeController = ThemeController.to;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(labels?.profile?.title),
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
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text(labels?.profile?.dialogheader),
                      content: Text(labels?.profile?.dialogcontent),
                      actions: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.check),
                          label: Text(labels?.profile?.dialogok),
                          onPressed: () {
                            authController.signOut();
                          },
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.close),
                          label: Text(labels?.profile?.dialogcancel),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Body(),
    );
  }
}
