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
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const Welcome(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => Signin(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => Signup(),
    ),
  ];
}
