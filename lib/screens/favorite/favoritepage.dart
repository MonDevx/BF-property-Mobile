import 'dart:convert';

import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:http/http.dart' as http;
import 'components/body.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final AuthController authController = AuthController.to;
  AppLocalizations_Labels labels;
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  // ignore: missing_return
  Future<List<RealEstateModel>> _loadMyFavoriteRealestate() async {
    var uri = Uri(
      scheme: 'https',
      host: 'us-central1-bfproperty.cloudfunctions.net',
      path: '/webApi/api/v1/favoriterealestatelist',
      queryParameters: {
        'favoritelist': authController.firestoreUser.value.favorite,
      },
    );
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
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
        labels?.propertydetail?.errorlabel,
        response.body,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        duration: Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar("รายการที่ชอบ"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => FavoritePage(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
          return Future.value(false);
        },
        child: FutureBuilder<List<RealEstateModel>>(
          future: authController.firestoreUser.value.favorite.length != 0
              ? _loadMyFavoriteRealestate()
              : null,
          builder: (context, AsyncSnapshot<List<RealEstateModel>> snapshot) {
            if (snapshot.hasData) {
              List<RealEstateModel> data = snapshot.data;

              return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Body(data));
            } else if (snapshot.hasError) {
              return Center(
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Text("${snapshot.error}")),
              );
            } else if (authController.firestoreUser.value.favorite.length ==
                0) {
              return Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                          height: getProportionateScreenWidth(150),
                          width: getProportionateScreenWidth(150),
                          child: SvgPicture.asset('assets/images/No_Data.svg')),
                      SizedBox(height: 15),
                      Text('ไม่มีรายการที่ชอบ', style: TextStyle(fontSize: 18))
                    ],
                  ),
                ),
              );
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
