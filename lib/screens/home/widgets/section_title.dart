import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: themeData.textTheme.headline1),
        GestureDetector(
          onTap: press,
          child: Text(labels?.home?.seemorelabel,
              style: themeData.textTheme.caption),
        ),
      ],
    );
  }
}
