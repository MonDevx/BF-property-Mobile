
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/localization/localizations.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../widgets/singlegridItem.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return GetBuilder<AuthController>(
        builder: (controller) => controller.firestoreUser.value!.uid == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 175.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),
                          CircleAvatar(
                            backgroundImage:
                                (controller.firestoreUser.value!.photoURL.toString().isNotEmpty
                                    ? AssetImage("assets/images/avatar.png")
                                    // NetworkImage(
                                    //     controller.firestoreUser.value!.photoURL.toString(),
                                    //   )
                                    : AssetImage("assets/images/avatar.png")),
                            radius: 60,
                          ),
                          SizedBox(height: 5),
                          Text(
                              controller.firestoreUser.value!.displayName != ""
                                  ? "${controller.firestoreUser.value!.displayName}"
                                  : "ยังไม่กรอกชื่อ",
                              style: TextStyle(fontSize: 22.0)),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView.count(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(5),
                        mainAxisSpacing: 16,
                        childAspectRatio: 2.5 / 2,
                        crossAxisSpacing: 16,
                        children: <Widget>[
                          SinglePageItem(
                            icon: 'assets/icons/list-outline.png',
                            title: labels!.profile!.listinglabel,
                            navigation: 'mylisting',
                          ),
                          SinglePageItem(
                            icon: 'assets/icons/health-outline.png',
                            title: labels.profile!.favoritelabel,
                            navigation: 'myfavorite',
                          ),
                          SinglePageItem(
                            icon: 'assets/icons/profile-outline.png',
                            title: labels.profile!.userlabel,
                            navigation: 'profile',
                          ),
                          SinglePageItem(
                            icon: 'assets/icons/setting-outline.png',
                            title: labels.profile!.settinglabel,
                            navigation: 'settings',
                          ),
                          SinglePageItem(
                            icon: 'assets/icons/email-outline.png',
                            title: labels.profile!.contactlabel,
                            navigation: 'contact',
                          ),
                          SinglePageItem(
                            icon: 'assets/icons/auth-outline.png',
                            title: labels.terms!.titlelabel,
                            navigation: 'terms',
                          ),
                        ]),
                  ),
                ],
              ));
  }
}
