import 'package:bfproperty/constants/globals.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/widgets/dropdownpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return GetBuilder<LanguageController>(
    builder: (controller) => Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(labels?.settings?.languageslabel, style: themeData.textTheme.bodyText1),
        DropdownPicker(
          menuOptions: Globals.languageOptions(context),
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