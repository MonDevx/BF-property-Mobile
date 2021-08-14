import 'package:bfproperty/models/models.dart';
import 'package:flutter/material.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  Future<RealEstateModel> futureAlbum;

  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (controller) => controller.firestoreUser.value?.uid == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchField(),
                    IconBtnWithCounter(
                      svgSrc: "assets/icons/Heart Icon.svg",
                      numOfitem: controller.firestoreUser.value.favorite?.length ,
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
                                    image: (controller
                                                .firestoreUser.value.photoURL !=
                                            ""
                                        ? new NetworkImage(controller
                                            .firestoreUser.value.photoURL)
                                        : AssetImage("assets/images/avatar.png"))))),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
