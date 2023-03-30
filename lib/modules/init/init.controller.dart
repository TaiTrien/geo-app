import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../amplifyconfiguration.dart';

class InitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    configureAmplify();
  }

  void configureAmplify() async {
    Amplify.addPlugin(AmplifyAuthCognito());
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      if (kDebugMode) {
        print("Amplify was already configured. But having some exceptions");
      }
    }
  }
}
