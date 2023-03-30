import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool _processing = false.obs;

  set processing(value) => _processing.value = value;
  get processing => _processing.value;

  Future<bool> signup(String firstName, String lastName, String email, String password) async {
    try {
      processing = true;
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.name: firstName,
        CognitoUserAttributeKey.familyName: lastName
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );

      print("hello");
      print(result.nextStep.signUpStep);

      processing = false;
      if (result.nextStep.signUpStep == "CONFIRM_SIGN_UP_STEP") return true;
      return false;
    } on AuthException catch (e) {
      safePrint(e.message);
      processing = false;
      throw Exception(e.message);
    }
  }
}
