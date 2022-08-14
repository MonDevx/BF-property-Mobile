import 'package:bfproperty/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import '../data/controllers/index.dart';
import '../modules/index.dart';
part './app_routes.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(
        name: Routes.SIGNIN,
        page: () => SignInPage(),
        transition: Transition.downToUp),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
      name: Routes.INTRO,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPage(),
    ),
    GetPage(
        name: Routes.MYFAVORITE,
        page: () => AuthController.to.firestoreUser.value != null
            ? FavoritePage()
            : SignInPage(),
        transition: AuthController.to.firestoreUser.value != null
            ? null
            : Transition.downToUp),
    GetPage(
      name: Routes.FILLTER,
      page: () => FillterPage(),
    ),
    GetPage(
      name: Routes.TERMS,
      page: () => TermsPage(),
    ),
    GetPage(
      name: Routes.CONTACT,
      page: () => ContactPage(),
    ),
  ];
}
