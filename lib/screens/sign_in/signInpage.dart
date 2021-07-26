import 'package:flutter/material.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'components/body.dart';
import '../../widgets/custom_app_bar.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels?.auth?.signInButton),
      ),
      body: Body(),
    );
  }
}
