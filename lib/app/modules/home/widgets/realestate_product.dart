import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/localization/localizations.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/models/real_estate_model.dart';
import '../../../widgets/product_card.dart';
import '../controllers/home_controller.dart';
import 'section_title.dart';

class RealestateProducts extends StatefulWidget {
  @override
  _RealestateProductsState createState() => _RealestateProductsState();
}

class _RealestateProductsState extends State<RealestateProducts> {
  final HomeController homeController = Get.find();

  Future<List<RealEstateModel>> loadRealestate() async {
    return await homeController.getRealestateRecommendList();
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: labels!.home!.speciallabel, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          child: FutureBuilder<List<RealEstateModel>>(
            future: loadRealestate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RealEstateModel> data = snapshot.data!;
                return Row(
                  children: [
                    ...List.generate(
                      snapshot.data!.length,
                      (index) {
                        return ProductCard(
                            realEstate: data[
                                index]); // here by default width and height is 0
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
