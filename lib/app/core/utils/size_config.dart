import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SizeConfig {
  static MediaQueryData  _mediaQueryData = MediaQuery.of(Get.context!);
  static double screenWidth = 0;
  static double screenHeight= 0;
  static double defaultSize= 0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;

  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
