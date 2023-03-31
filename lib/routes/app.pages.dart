import 'package:geo_app/modules/auth/auth.binding.dart';
import 'package:geo_app/modules/hub/hub.binding.dart';
import 'package:geo_app/pages/home.dart';
import 'package:geo_app/pages/signin.dart';
import 'package:geo_app/pages/signup.dart';
import 'package:geo_app/pages/splash.dart';
import 'package:geo_app/pages/welcome.dart';
import 'package:get/get.dart';
part 'app.routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
      bindings: [
        AuthBinding(),
        HubBinding(),
      ],
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const Welcome(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => Signin(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => Signup(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => Home(),
      bindings: [
        HubBinding(),
      ],
    ),
  ];
}
