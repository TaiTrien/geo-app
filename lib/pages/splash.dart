import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:geo_app/routes/app.pages.dart';
import 'package:get/get.dart';
import '../services/preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 2600), () async {
      if (await Preferences.getToken() != null) {
        return Get.offAndToNamed(Routes.home);
      } else {
        Get.offAndToNamed(Routes.login);
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
                FadeInUp(child: const FlutterLogo()),
                const SizedBox(height: 30),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
