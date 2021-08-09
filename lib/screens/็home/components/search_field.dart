import 'package:bfproperty/constants/constants.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/fillter'),
        borderRadius: BorderRadius.circular(15),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: labels?.home?.searchlabel,
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
