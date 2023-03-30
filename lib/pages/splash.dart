import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:geo_app/modules/auth/auth.controller.dart';
import 'package:geo_app/routes/app.pages.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  final AuthController _authController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (_authController.isSignedIn) {
        Get.offAndToNamed(Routes.home);
      } else {
        Get.offAndToNamed(Routes.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInUp(child: const FlutterLogo(size: 150)),
                const SizedBox(height: 30),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
