import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../core/localization/localizations.dart';
import '../core/utils/size_config.dart';
import '../data/controllers/index.dart';
import '../data/models/real_estate_model.dart';
import '../routes/app_pages.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.realEstate,
  }) : super(key: key);

  final double width, aspectRetio;
  final RealEstateModel realEstate;
  final UserController userController = UserController.to;
  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => Get.toNamed('/detail', arguments: realEstate.name),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: aspectRetio,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Hero(
                        tag: realEstate.name!,
                        child: Image.network(
                          realEstate.firstimg!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  realEstate.name!.replaceAll(new RegExp(r'-'), ' '),
                  style: themeData.textTheme.bodyText1,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  realEstate.idtype == 1
                      ? labels!.propertydetail!.typeproperty1label
                      : realEstate.idtype == 2
                          ? labels!.propertydetail!.typeproperty2label
                          : labels!.propertydetail!.typeproperty3label,
                  maxLines: 1,
                  softWrap: false,
                  style: themeData.textTheme.bodyText2,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "฿ " +
                            (realEstate.price! / 1000000).toStringAsFixed(2) +
                            " M",
                        style: themeData.textTheme.headline1),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => authController.firebaseUser.value != null
                          ? userController.upDateFavorite(
                              realEstate.id, context)
                          : Get.toNamed(Routes.SIGNIN),
                      child: Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(35),
                          width: getProportionateScreenWidth(35),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: GetBuilder<AuthController>(
                            builder: (controller) => SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
                              color: controller.firestoreUser.value != null
                                  ? controller.firestoreUser.value!.favorite!
                                          .contains(realEstate.id)
                                      ? Color(0xFFFF4848)
                                      : Color(0xFFDBDEE4)
                                  : Color(0xFFDBDEE4),
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
