import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:geo_app/variants/regexp.dart';
import 'package:get/get.dart';

import '../routes/app.pages.dart';
import '../utils/device.utils.dart';
import '../widgets/button.dart';
import '../widgets/page_wrapper.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
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
    );
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
                validator: ValidationBuilder().required().build(),
                decoration: const InputDecoration(
                  hintText: 'First name',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: ValidationBuilder().required().build(),
                decoration: const InputDecoration(
                  hintText: 'Last name',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: ValidationBuilder().email().required().build(),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: ValidationBuilder()
                    .regExp(RegExps.password,
                        "Password contains at least 1 uppercase letter, 1 uppercase letter and 1 number or special character!")
                    .required('Please enter your password')
                    .build(),
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye), //TODO: handle view password
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Button(
                    label: 'Sign up',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        //TODO: handle login
                        Get.toNamed(Routes.signup);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
