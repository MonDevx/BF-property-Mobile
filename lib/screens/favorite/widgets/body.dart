import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:bfproperty/widgets/realestate_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<RealEstateModel> data;
  Body(this.data);

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Column(
      children: [
        ...List.generate(
          data.length,
          (index) {
            return RealestateCard(
                realEstate:
                    data[index]); // here by default width and height is 0
          },
        ),
      ],
    );
  }
}
