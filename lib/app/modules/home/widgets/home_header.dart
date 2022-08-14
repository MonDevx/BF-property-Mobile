
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/size_config.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/models/real_estate_model.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  late Future<RealEstateModel> futureAlbum;

  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
        builder: (controller) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchField(),
                    IconBtnWithCounter(
                      svgSrc: "assets/icons/Heart Icon.svg",
                      numOfitem:0,
                      // controller.firebaseUser.value != null?
                      //     controller.firestoreUser.value.favorite?.length:0,
                      press: () {
                        Get.toNamed('/myfavorite');
                      },
                    ),
                    InkWell(
                      //authController.signOut()
                      borderRadius: BorderRadius.circular(100),
                      onTap: () => Get.toNamed("/profile"),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: new Container(
                            width: getProportionateScreenWidth(46),
                            height: getProportionateScreenWidth(46),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: controller.firebaseUser.value != null?
                                     AssetImage(
                                            "assets/images/avatar.png")
                                    // NetworkImage(controller.firestoreUser.value.photoURL)
                                     : AssetImage(
                                            "assets/images/avatar.png")))),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
