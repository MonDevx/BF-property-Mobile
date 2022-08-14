
import 'package:flutter/material.dart';

import '../../../core/localization/localizations.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../contact/widgets/body.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels!.terms!.titlelabel),
      ),
      body: Body(),
    );
  }
}
