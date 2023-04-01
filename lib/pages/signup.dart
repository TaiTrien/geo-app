import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:geo_app/modules/auth/auth.controller.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:geo_app/variants/regexp.dart';
import 'package:get/get.dart';

import '../routes/app.pages.dart';
import '../utils/device.utils.dart';
import '../widgets/button.dart';
import '../widgets/page_wrapper.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _viewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => PageWrapper(
          loading: _authController.processing,
          onBack: () => Get.back(),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              height: DeviceUtils.deviceHeight(context),
              width: DeviceUtils.deviceWidth(context),
              child: Column(
                children: [
                  Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Create your new account",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  renderForm(context),
                ],
              ),
            ),
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
                controller: _firstNameController,
                validator: ValidationBuilder().required().build(),
                decoration: const InputDecoration(
                  hintText: 'First name',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _lastNameController,
                validator: ValidationBuilder().required().build(),
                decoration: const InputDecoration(
                  hintText: 'Last name',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                validator: ValidationBuilder().email().required().build(),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: !_viewPassword,
                validator: ValidationBuilder()
                    .regExp(RegExps.password,
                        "Password contains at least 1 uppercase letter, 1 uppercase letter, 1 number, 1 special character and length above 8!")
                    .required('Please enter your password')
                    .build(),
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
                    label: 'Sign up',
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        String firstName = _firstNameController.text.trim();
                        String lastName = _lastNameController.text.trim();
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();

                        try {
                          bool isSignupCompleted = await _authController.signup(firstName, lastName, email, password);
                          if (isSignupCompleted) {
                            ToastUtils.showSuccess("Please verify your email then login!");
                            Get.offAndToNamed(Routes.signin);
                          } else {
                            ToastUtils.showError("Signup failed!");
                          }
                        } catch (e) {
                          ToastUtils.showError(e.toString());
                        }
                      }
                    }),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Have an account? ",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),
                TextSpan(
                    text: 'Sign in',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAndToNamed(Routes.signin);
                      })
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
