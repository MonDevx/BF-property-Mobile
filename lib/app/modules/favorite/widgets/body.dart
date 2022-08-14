
import 'package:flutter/material.dart';

import '../../../core/localization/localizations.dart';
import '../../../data/models/real_estate_model.dart';
import '../../../widgets/realestate_card.dart';

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
