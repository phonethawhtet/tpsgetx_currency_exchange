import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/App_binding.dart';
import 'app/controllers/theme_controller.dart';
import 'app/pages/splash/splash_page.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/translations/app_translations.dart';

void main() {
  var themeController = Get.put(ThemeController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: AppBinding(),
    initialRoute: Routes.SPLASH,
    
    theme: themeController.activeTheme,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    darkTheme: themeController.darkTheme,
    home: SplashPage(),
    locale: Locale('pt', 'BR'),
    translationsKeys: AppTranslation.translations,
  ));
}
