import 'package:bfproperty/widgets/no_account_text.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(labels?.auth?.welcomeText,
                    style: themeData.textTheme.headline6),
                Text(
                  "${labels?.auth?.welcomeSubText1}  \n${labels?.auth?.welcomeSubText2}",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserCredential {}
