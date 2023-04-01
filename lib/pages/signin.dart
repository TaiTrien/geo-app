import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:geo_app/modules/auth/auth.controller.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:geo_app/widgets/button.dart';
import 'package:geo_app/widgets/page_wrapper.dart';
import 'package:get/get.dart';
import '../routes/app.pages.dart';
import '../utils/device.utils.dart';
import '../variants/variants.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _viewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageWrapper(
          loading: _authController.processing,
          body: Column(
            children: [
              Container(
                height: DeviceUtils.deviceHeight(context) * 0.3,
                width: DeviceUtils.deviceWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Drawables.welcomeBg),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Welcome back",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        "Log to your account",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      renderForm(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget renderForm(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: ValidationBuilder().email().required().build(),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: !_viewPassword,
                validator: ValidationBuilder().required().build(),
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(_viewPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _viewPassword = !_viewPassword;
                      });
                    },
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Button(
                    label: 'Sign in',
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        try {
                          bool result = await _authController.signin(email, password);
                          if (result) return Get.offAndToNamed(Routes.home);
                          ToastUtils.showError("Sign in failed");
                        } catch (e) {
                          ToastUtils.showError(e.toString());
                        }
                      }
                    }),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Don\'t have an account? ",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                TextSpan(
                    text: 'Sign up',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAndToNamed(Routes.signup);
                      })
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
