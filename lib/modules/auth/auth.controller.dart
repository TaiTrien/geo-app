import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool _processing = false.obs;
  final RxBool _isSignedIn = false.obs;

  set processing(value) => _processing.value = value;
  get processing => _processing.value;

  set isSignedIn(value) => _isSignedIn.value = value;
  get isSignedIn => _isSignedIn.value;

  @override
  void onInit() async {
    super.onInit();
    await checkSignedIn();
  }

  Future<void> checkSignedIn() async {
    final AuthSession authSession = await Amplify.Auth.fetchAuthSession();
    isSignedIn = authSession.isSignedIn;
  }

  Future<bool> signup(String firstName, String lastName, String email, String password) async {
    try {
      processing = true;
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.name: firstName,
        CognitoUserAttributeKey.familyName: lastName
      };
      final SignUpResult result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      processing = false;
      if (result.nextStep.signUpStep == "CONFIRM_SIGN_UP_STEP") return true;
      return false;
    } on AuthException catch (e) {
      safePrint(e.message);
      processing = false;
      throw Exception(e.message);
    }
  }

  Future<bool> signin(String email, String password) async {
    try {
      processing = true;
      await Amplify.Auth.signOut();
      final SignInResult result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      processing = false;
      if (result.isSignedIn) {
        isSignedIn = true;
        return true;
      }
      return false;
    } on AuthException catch (e) {
      safePrint(e.message);
      processing = false;
      throw Exception(e.message);
    }
  }
}
