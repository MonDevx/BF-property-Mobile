import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/localization/localizations.dart';
import '../models/real_estate_model.dart';
import 'auth_controller.dart';

class UserController extends GetxController {
  static UserController to = Get.find();
  late AppLocalizations_Labels labels  ;
  final AuthController authController = AuthController.to;

  Future upDateFavorite(id, BuildContext context) async {
    final labels = AppLocalizations.of(context);
    var idToken = await authController.getIdToken;
    if (authController.firestoreUser.value!.favorite!.contains(id)) {
      authController.firestoreUser.value!.favorite!.remove(id);
    } else {
      authController.firestoreUser.value!.favorite!.add(id);
    }
    final response = await http.put(
      Uri.parse(
          'https://us-central1-bfproperty.cloudfunctions.net/webApi/api/v1/usersupdatefavorite'),
      headers: <String, String>{
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, List?>{
        'favorite': authController.firestoreUser.value!.favorite,
      }),
    );

    if (response.statusCode == 200) {
      authController.getFirestoreUser();
      Get.snackbar(
        labels!.propertydetail!.successlabel,
        labels.propertydetail!.successfavoritelabel,
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
        labels!.propertydetail!.errorlabel,
        response.body,
        colorText: Get.theme.snackBarTheme.actionTextColor,
        backgroundColor: Colors.red[400],
        duration: Duration(seconds: 5),
      );
    }
  }

  Future<List<RealEstateModel>?> loadMyFavoriteRealestate(
      BuildContext context) async {
    final labels = AppLocalizations.of(context);
    var idToken = await authController.getIdToken;
    var uri = Uri(
      scheme: 'https',
      host: 'us-central1-bfproperty.cloudfunctions.net',
      path: '/webApi/api/v1/favoriterealestatelist',
      queryParameters: {
        'favoritelist': authController.firestoreUser.value!.favorite,
      },
    );
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new RealEstateModel.fromJson(data))
          .toList();
    } else {
      Get.snackbar(
        labels!.propertydetail!.errorlabel,
        response.body,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        duration: Duration(seconds: 5),
      );
    }
  }
}
