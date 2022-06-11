import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/screens/terms/widgets/body.dart';
import 'package:bfproperty/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels?.terms?.titlelabel),
      ),
      body: Body(),
    );
  }
}
