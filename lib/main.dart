import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/routes/app.pages.dart';
import 'package:geo_app/themes/app.theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      unknownRoute: GetPage(name: '/unknown', page: () => const Splash()),
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
