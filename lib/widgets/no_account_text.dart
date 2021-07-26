import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/app_themes.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/route_manager.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labels?.auth?.account,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/signup"),
          child: Text(
            labels?.auth?.signUpButton,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: AppThemes.dodgerBlue),
          ),
        ),
      ],
    );
  }
}
