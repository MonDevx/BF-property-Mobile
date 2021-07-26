import 'dart:convert';
import 'package:bfproperty/localization/localizations.dart';
import 'package:bfproperty/models/real_estate_model.dart';
import 'package:bfproperty/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:bfproperty/constants/size_config.dart';
import 'package:http/http.dart' as http;
import 'section_title.dart';

Future<List<RealEstateModel>> fetchRealestate() async {
  final response = await http.get(Uri.parse(
      'https://us-central1-bfproperty.cloudfunctions.net/webApi/api/v1/realestaterecommendlist'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new RealEstateModel.fromJson(data))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}

class RealestateProducts extends StatefulWidget {
  @override
  _RealestateProductsState createState() => _RealestateProductsState();
}

class _RealestateProductsState extends State<RealestateProducts> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: labels?.home?.speciallabel, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(

          child: FutureBuilder<List<RealEstateModel>>(
            future: fetchRealestate(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RealEstateModel> data = snapshot.data;
                return Row(
                  children: [
                    ...List.generate(
                      snapshot.data.length,
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
