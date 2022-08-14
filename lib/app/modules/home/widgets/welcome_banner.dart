import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/localizations.dart';
import '../../../core/theme/app_themes.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/controllers/auth_controller.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return GetX<AuthController>(
      init: AuthController(),
      builder: (controller) => Container(
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
                text: ("${labels?.home?.youlabel}" +
                        (controller.firestoreUser.value != null
                            ? (controller.firestoreUser.value!.displayName != ""
                                ? " ${controller.firestoreUser.value!.displayName}"
                                : " ${controller.firestoreUser.value!.email}")
                            : " Guset"))
                    .toUpperCase(),
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
