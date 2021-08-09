import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/screens/contact/components/body.dart';
import 'package:bfproperty/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar("Contact"),
      ),
      body: Body(),
    );
  }
}
