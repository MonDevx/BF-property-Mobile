
import 'package:bfproperty/screens/Sign_in/SignInPage.dart';
import 'package:bfproperty/screens/Sign_up/signuppage.dart';
import 'package:bfproperty/screens/contact/contactpage.dart';
import 'package:bfproperty/screens/details/detailpage.dart';
import 'package:bfproperty/screens/favorite/favoritepage.dart';
import 'package:bfproperty/screens/fillter/fillterpage.dart';
import 'package:bfproperty/screens/forgot_password/fogetpasswordpage.dart';
import 'package:bfproperty/screens/home/homepage.dart';
import 'package:bfproperty/screens/on_boarding/onboardingpage.dart';
import 'package:bfproperty/screens/profile/profilepage.dart';
import 'package:bfproperty/screens/settings/settingscreen.dart';
import 'package:bfproperty/screens/terms/termspage.dart';
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
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: '/forgetpassword',
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: '/settings',
      page: () => SettingScreen(),
    ),
    GetPage(
      name: '/detail',
      page: () => DetailScreen(),
    ),
    GetPage(
      name: '/myfavorite',
      page: () => FavoriteScreen(),
    ),
    GetPage(
      name: '/fillter',
      page: () => Fillter(),
    ),
    GetPage(
      name: '/terms',
      page: () => TermsScreen(),
    ),
    GetPage(
      name: '/contact',
      page: () => ContactScreen(),
    ),
  ];
}
