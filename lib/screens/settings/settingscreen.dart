import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart' show  BuildContext, PreferredSize, Scaffold, Size, StatelessWidget, Widget;
import '../../widgets/custom_app_bar.dart';


import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels?.settings?.title),
      ),
      body: Body(),
    );
  }
}
