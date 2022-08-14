
import 'package:bfproperty/app/core/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/localizations.dart';
import '../../../data/controllers/theme_controller.dart';
import '../../../widgets/dropdownpicker.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return GetBuilder<ThemeController>(
      builder: (controller) => Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("ธีม", style: themeData.textTheme.bodyText1),
          DropdownPicker(
            menuOptions: Globals.themeOptions(),
            selectedOption: controller.currentTheme,
            onChanged: (value) async {
              await controller.setThemeMode(value);
              Get.forceAppUpdate();
            },
          ),
        ],
      )),
    );
  }
}
