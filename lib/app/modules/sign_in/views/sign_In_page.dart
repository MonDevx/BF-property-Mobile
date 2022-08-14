import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/localization/localizations.dart';
import '../../../core/utils/size_config.dart';
import '../widgets/body.dart';
import '../../../widgets/custom_app_bar.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final labels = AppLocalizations.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.close,
                color: Get.theme.colorScheme.primary,
              ),
              onPressed: () => Navigator.pop(context))
        ],
      ),
      body: Body(),
    );
  }
}
