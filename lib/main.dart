import 'package:cinepolis_admin/app/pages/splash/splash.page.dart';
import 'package:cinepolis_admin/core/routes/bindings.dart';
import 'package:cinepolis_admin/core/routes/pages.dart';
import 'package:cinepolis_admin/core/theme/dark_app_theme.dart';
import 'package:cinepolis_admin/data/services/auth/auth.api.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      theme: darkAppTheme,
      darkTheme: darkAppTheme,
      highContrastTheme: darkAppTheme,
      highContrastDarkTheme: darkAppTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      initialRoute: Routes.splash,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashBinding(AuthApiService()),
      getPages: Pages.pages,
      home: const SplashPage(), //LoginPage(),
    );
  }
}
