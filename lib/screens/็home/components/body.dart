import 'package:flutter/material.dart';
import 'package:bfproperty/constants/size_config.dart';
import 'welcome_banner.dart';
import 'home_header.dart';
import 'realestate_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            WelcomeBanner(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(10)),
            RealestateProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
