
import 'package:bfproperty/app/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../core/localization/localizations.dart';
import '../core/utils/size_config.dart';
import '../data/controllers/auth_controller.dart';

class RealestateCard extends StatelessWidget {
  RealestateCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.realEstate,
  }) : super(key: key);
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  final double width, aspectRetio;
  final RealEstateModel realEstate;
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return InkWell(
        onTap: () => Get.toNamed('/detail', arguments: realEstate.name),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(140),
                    width: getProportionateScreenWidth(115),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Hero(
                        tag: realEstate.name!,
                        child: Image.network(
                          realEstate.firstimg!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 2.0),
                              child: Text(
                                realEstate.name!
                                    .replaceAll(new RegExp(r'-'), ' '),
                                style: themeData.textTheme.bodyText1,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Text(realEstate.idtype == 1
                                ? labels!.propertydetail!.typeproperty1label
                                : realEstate.idtype == 2
                                    ? labels!.propertydetail!.typeproperty2label
                                    : labels
                                        !.propertydetail!.typeproperty3label),
                            Text(
                              realEstate.address! +
                                  " " +
                                  realEstate.district! +
                                  " " +
                                  realEstate.subDistrict! +
                                  " " +
                                  realEstate.province! +
                                  " " +
                                  realEstate.zipcode!,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: themeData.textTheme.bodyText2,
                            ),
                            Row(
                              children: [
                                Text(
                                  realEstate.propertysize.toString() +
                                      "\b${labels.propertydetail!.sizelabel}",
                                  style: themeData.textTheme.bodyText2,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "\$${oCcy.format(realEstate.price! / realEstate.propertysize!)} /\b${labels.propertydetail!.sizelabel}",
                                  style: themeData.textTheme.bodyText2,
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "\$${oCcy.format(realEstate.price)} ${labels.propertydetail!.pricelabel}",
                                    style: themeData.textTheme.bodyText1,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
