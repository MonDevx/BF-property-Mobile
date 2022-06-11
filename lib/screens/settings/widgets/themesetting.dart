import 'package:bfproperty/constants/globals.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/widgets/dropdownpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({Key key}) : super(key: key);

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
            menuOptions: Globals.themeOptions(context),
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
