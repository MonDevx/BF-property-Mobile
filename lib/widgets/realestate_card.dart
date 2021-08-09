import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RealestateCard extends StatelessWidget {
  RealestateCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.realEstate,
  }) : super(key: key);
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  final double width, aspectRetio;
  final RealEstateModel realEstate;
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
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
                        tag: realEstate.name,
                        child: Image.network(
                          realEstate.firstimg,
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
                                realEstate.name
                                    .replaceAll(new RegExp(r'-'), ' '),
                                style: new TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            Text(realEstate.idtype == 1
                                ? labels?.propertydetail?.typeproperty1label
                                : realEstate.idtype == 2
                                    ? labels?.propertydetail?.typeproperty2label
                                    : labels
                                        ?.propertydetail?.typeproperty3label),
                            Text(
                              realEstate.address +
                                  " " +
                                  realEstate.district +
                                  " " +
                                  realEstate.subDistrict +
                                  " " +
                                  realEstate.province +
                                  " " +
                                  realEstate.zipcode,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: new TextStyle(fontSize: 14.0),
                            ),
                            Row(
                              children: [
                                Text(
                                  realEstate.propertysize.toString() +
                                      "\b${labels?.propertydetail?.sizelabel}",
                                  style: new TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "\$${oCcy.format(realEstate.price / realEstate.propertysize)} /\b${labels?.propertydetail?.sizelabel}",
                                  style: new TextStyle(fontSize: 14.0),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "\$${oCcy.format(realEstate.price)} ${labels?.propertydetail?.pricelabel}",
                                    style: new TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold),
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
