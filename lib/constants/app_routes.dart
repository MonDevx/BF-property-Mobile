import 'package:bfproperty/screens/%E0%B9%87Home/HomePage.dart';
import 'package:bfproperty/screens/Forgot_password/fogetpasswordpage.dart';
import 'package:bfproperty/screens/On_Boarding/OnBoardingPage.dart';
import 'package:bfproperty/screens/Profile/ProfilePage.dart';
import 'package:bfproperty/screens/Sign_in/SignInPage.dart';
import 'package:bfproperty/screens/Sign_up/signuppage.dart';
import 'package:bfproperty/screens/details/detailpage.dart';
import 'package:bfproperty/screens/favorite/favoritepage.dart';
import 'package:bfproperty/screens/settings/settingscreen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(
      name: '/signin',
      page: () => SignInScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/intro',
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: '/forgetpassword',
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfilePage(),
    ),
    GetPage(
      name: '/settings',
      page: () => SettingPage(),
    ),
    GetPage(
      name: '/detail',
      page: () => DetailPage(),
    ),
       GetPage(
      name: '/myfavorite',
      page: () => FavoritePage(),
    ),
  ];
}
