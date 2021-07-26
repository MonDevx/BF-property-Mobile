import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bfproperty/models/models.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';

class UserController extends GetxController {
  static UserController to = Get.find();
  AppLocalizations_Labels labels;
  final AuthController authController = AuthController.to;

  Future upDateFavorite(id, BuildContext context) async {
    final labels = AppLocalizations.of(context);
    var idToken = await authController.getIdToken;
    if (authController.firestoreUser.value.favorite.contains(id)) {
      authController.firestoreUser.value.favorite.remove(id);
    } else {
      authController.firestoreUser.value.favorite.add(id);
    }
    final response = await http.put(
      Uri.parse(
          'https://us-central1-bfproperty.cloudfunctions.net/webApi/api/v1/usersupdatefavorite'),
      headers: <String, String>{
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, List>{
        'favorite': authController.firestoreUser.value.favorite,
      }),
    );

    if (response.statusCode == 200) {
      authController.getFirestoreUser();
      Get.snackbar(
        labels.propertydetail.successlabel,
        labels.propertydetail.successfavoritelabel,
        colorText: Get.theme.snackBarTheme.actionTextColor,
        backgroundColor: Colors.green[400],
        duration: Duration(seconds: 5),
        // mainButton: FlatButton(
        //   child: Text(
        //     'ย้อนกลับ',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   onPressed: () => {upDateFavorite(), Get.back()},
        // ),
      );
      authController.update();

    } else {
      Get.snackbar(
        labels.propertydetail.errorlabel,
        response.body,
        colorText: Get.theme.snackBarTheme.actionTextColor,
        backgroundColor: Colors.red[400],
        duration: Duration(seconds: 5),
      );
    }
  }
}
