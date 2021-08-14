import 'dart:io';

import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/menu_option_model.dart';
import 'package:flutter/material.dart';

class Globals {
  static final String defaultLanguage = Platform.localeName.split('_')[0];

//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static List<MenuOptionsModel> languageOptions(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return [
      MenuOptionsModel(
          key: "th", value: "${labels?.settings?.languagesthlabel}"),
      MenuOptionsModel(
          key: "en", value: "${labels?.settings?.languagesenglabel}"),
      MenuOptionsModel(
          key: "zh", value: "${labels?.settings?.languageszhlabel}"),
    ];
  }
    static List<MenuOptionsModel> themeOptions(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return [
      MenuOptionsModel(
          key: "light", value: "Light theme"),
      MenuOptionsModel(
          key: "dark", value: "Dark theme"),
           MenuOptionsModel(
          key: "system", value: "Defaut system"),
    ];
  }
}
