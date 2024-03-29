import 'package:flutter/material.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'widgets/body.dart';
import '../../widgets/custom_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels?.auth?.signUpButton),
      ),
      body: Body(),
    );
  }
}
