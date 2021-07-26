import 'package:bfproperty/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text(labels?.auth?.signUpText, style: headingStyle),
                Text(
                  "${labels?.auth?.signUpSubText1} \n${labels?.auth?.signUpSubText2}",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  '${labels?.auth?.signUpSubText3} \n${labels?.auth?.signUpSubText4}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
