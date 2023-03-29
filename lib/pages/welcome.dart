import 'package:flutter/material.dart';
import 'package:geo_app/utils/device.utils.dart';
import 'package:geo_app/variants/drawables.dart';
import 'package:geo_app/widgets/button.dart';

import '../variants/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceUtils.deviceHeight(context),
        width: DeviceUtils.deviceWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Drawables.welcomeBg),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "Picked,\nTracked &\nDeliveried.\n< 2hrs",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(color: AppColors.white),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Button(
                    label: 'Sign in',
                    onPress: () {},
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Create an account',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
