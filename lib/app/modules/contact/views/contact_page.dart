
import 'package:flutter/material.dart';

import '../../../core/localization/localizations.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/body.dart';


class ContactPage extends StatefulWidget  {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
