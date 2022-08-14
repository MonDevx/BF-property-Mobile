
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../core/localization/localizations.dart';
import '../core/theme/app_themes.dart';
import '../core/utils/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labels!.auth!.account,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/signup"),
          child: Text(
            labels.auth!.signUpButton,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: AppThemes.dodgerBlue),
          ),
        ),
      ],
    );
  }
}
