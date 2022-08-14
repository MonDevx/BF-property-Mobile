

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/localization/localizations.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/controllers/user_controller.dart';
import '../../../data/models/real_estate_model.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/body.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final AuthController authController = AuthController.to;
  final UserController userController = UserController.to;
  late AppLocalizations_Labels labels;
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
        child: GradientAppBar(labels!.favorite!.titlelabel),
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
        child: FutureBuilder<List<RealEstateModel>?>(
          future: authController.firestoreUser.value!.favorite!.length != 0
            ?userController.loadMyFavoriteRealestate(context)
              : null,
          builder: (context, AsyncSnapshot<List<RealEstateModel>?> snapshot) {
            if (snapshot.hasData) {
              List<RealEstateModel> data = snapshot.data!;

              return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Body(data));
            } else if (snapshot.hasError) {
              return Center(
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Text("${snapshot.error}")),
              );
            } else if (authController.firestoreUser.value!.favorite!.length ==
                0) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              Scaffold.of(context).appBarMaxHeight!,
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
                            Text(labels.favorite!.emptylabel,
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
