import 'package:bfproperty/constants/globals.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/widgets/dropdownpicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: [
            languageListTile(context),
          ],
        ),
      ),
    );
  }
}

languageListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return GetBuilder<LanguageController>(
    builder: (controller) => ListTile(
      title: Text(labels?.settings?.languageslabel),
      trailing: DropdownPicker(
        menuOptions: Globals.languageOptions(context),
        selectedOption: controller.currentLanguage,
        onChanged: (value) async {
          await controller.updateLanguage(value);
          Get.forceAppUpdate();
        },
      ),
    ),
  );
}
