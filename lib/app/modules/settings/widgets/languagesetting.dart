
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/localizations.dart';
import '../../../core/utils/globals.dart';
import '../../../data/controllers/language_controller.dart';
import '../../../widgets/dropdownpicker.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return GetBuilder<LanguageController>(
    builder: (controller) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labels!.settings!.languageslabel, style: themeData.textTheme.bodyText1),
        DropdownPicker(
          menuOptions: Globals.languageOptions(),
          selectedOption: controller.currentLanguage,
          onChanged: (value) async {
            await controller.updateLanguage(value);
            Get.forceAppUpdate();
          },
        ),
      ],
    )),
  );
  }
}