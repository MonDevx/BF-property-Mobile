import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels?.auth?.resetPasswordTitle),
      ),
      body: Body(),
    );
  }
}
