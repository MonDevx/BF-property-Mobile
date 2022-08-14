import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/configs/app_config.dart';
import 'app/core/localization/localizations.dart';
import 'app/core/theme/app_themes.dart';
import 'app/data/controllers/index.dart';
import 'app/routes/app_pages.dart';
import 'app/core/utils/extensions/loading_extension.dart';

int? initScreen;
void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    initScreen = await sharedPref.getInt("initScreen");
    await sharedPref.setInt("initScreen", 1);
    await Firebase.initializeApp();
    await GetStorage.init();
    Environment env;
    if (kDebugMode) {
      env = Environment.dev;
    } else {
      env = Environment.prod;
    }
    setEnvironment(env);
    await dotenv.load(fileName: ".env");
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
    Get.put<ThemeController>(ThemeController());
    Get.put<LanguageController>(LanguageController());

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      // Get.snackbar("", details.exception.toString());
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    Get.snackbar(stack.toString(), error.toString());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          // smartManagement: SmartManagement.full,
          //begin language translation stuff //https://github.com/aloisdeniel/flutter_sheet_localization
          locale: languageController.getLocale, // <- Current locale
          localizationsDelegates: [
            const AppLocalizationsDelegate(), // <- Your custom delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales:
              AppLocalizations.languages.keys.toList(), // <- Supported locales
          //end language translation stuff
          navigatorObservers: [
            // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
          ],
          debugShowCheckedModeBanner: false,
          // defaultTransition: Transition.fade,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: initScreen == 0 || initScreen == null
              ? Routes.INTRO
              : Routes.HOME,
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
