import 'dart:ui';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/modules/init/init.binding.dart';
import 'package:geo_app/routes/app.pages.dart';
import 'package:geo_app/themes/app.theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'config/amplify.config.dart';
import 'pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await configureAmplify();
  runApp(const MyApp());
}

Future<void> configureAmplify() async {
  Amplify.addPlugin(AmplifyAuthCognito());
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    if (kDebugMode) {
      print("Amplify was already configured. But having some exceptions");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
      unknownRoute: GetPage(name: '/unknown', page: () => const Splash()),
      initialRoute: Routes.splash,
      initialBinding: InitBinding(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
