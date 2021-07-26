import 'package:bfproperty/constants/app_themes.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';

import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/get.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => controller?.firestoreUser?.value?.uid == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              // height: 90,
              width: double.infinity,
              margin: EdgeInsets.all(getProportionateScreenWidth(20)),
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(15),
              ),
              decoration: BoxDecoration(
                color: AppThemes.dodgerBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(text: "${labels?.home?.welcometext}\n"),
                    TextSpan(
                      text:("${labels?.home?.youlabel}"+ (controller.firestoreUser.value.displayName != ""
                          ? " ${controller.firestoreUser.value.displayName}"
                          : " ${controller.firestoreUser.value.email}")).toUpperCase(),
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
