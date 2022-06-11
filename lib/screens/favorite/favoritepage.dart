import 'dart:convert';

import 'package:bfproperty/constants/size_config.dart';
import 'package:bfproperty/controllers/auth_controller.dart';
import 'package:bfproperty/controllers/controllers.dart';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/body.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final AuthController authController = AuthController.to;
  final UserController userController = UserController.to;
  AppLocalizations_Labels labels;
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  // ignore: missing_return

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GradientAppBar(labels.favorite.titlelabel),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => FavoriteScreen(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
          return Future.value(false);
        },
        child: FutureBuilder<List<RealEstateModel>>(
          future: authController.firestoreUser.value.favorite.length != 0
              ? userController.loadMyFavoriteRealestate(context)
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
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              Scaffold.of(context).appBarMaxHeight,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                                height: getProportionateScreenWidth(150),
                                width: getProportionateScreenWidth(150),
                                child: SvgPicture.asset(
                                    'assets/images/No_Data.svg')),
                            SizedBox(height: 15),
                            Text(labels.favorite.emptylabel,
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
