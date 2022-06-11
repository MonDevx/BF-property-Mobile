import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Center(
      child: Container(
        child: Text("Facebook Fanpage BF-property",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
