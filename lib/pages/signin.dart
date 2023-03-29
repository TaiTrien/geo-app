import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:geo_app/widgets/button.dart';
import '../utils/device.utils.dart';
import '../variants/variants.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final _formKey = GlobalKey<FormState>();

  Widget renderForm(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: ValidationBuilder().email().required('Please enter your email').build(),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.account_circle_rounded),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: ValidationBuilder()
                    .regExp(RegExp(r"/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/"),
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
                    label: 'Sign in',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        //TODO: handle login
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
