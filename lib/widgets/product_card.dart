import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.realEstate,
  }) : super(key: key);

  final double width, aspectRetio;
  final RealEstateModel realEstate;
  final UserController userController = UserController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
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
                        tag: realEstate.name,
                        child: Image.network(
                          realEstate.firstimg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  realEstate.name.replaceAll(new RegExp(r'-'), ' '),
                  style: TextStyle(color: Colors.black),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "฿ " +
                          (realEstate.price / 1000000).toStringAsFixed(2) +
                          " M",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => userController.upDateFavorite(realEstate.id,context),
                      child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                          height: getProportionateScreenWidth(35),
                          width: getProportionateScreenWidth(35),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: GetBuilder<AuthController>(
                            builder: (controller) => SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
                              color: controller.firestoreUser.value.favorite
                                      .contains(realEstate.id)
                                  ? Color(0xFFFF4848)
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
