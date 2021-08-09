import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labels?.terms?.headerlabel,
                style:
                    new TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(labels?.terms?.subheaderlabel1,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.detaillabel1),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.subheaderlabel2,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.detaillabel2),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.subheaderlabel3,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.detaillabel3),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.subheaderlabel4,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.detaillabel4),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.subheaderlabel5,
                  style: new TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(labels?.terms?.detaillabel5),
            ],
          ),
        ),
      ),
    );
  }
}
