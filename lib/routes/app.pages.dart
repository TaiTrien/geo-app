import 'package:geo_app/pages/splash.dart';
import 'package:get/get.dart';
part 'app.routes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
    )
  ];
}
