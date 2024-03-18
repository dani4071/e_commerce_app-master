import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/device/device_utility.dart';

class buttonSkip extends StatelessWidget {
  const buttonSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: danDeviceUtils.appBarHeight(),
        right: danSizes.defaultSpace,
        top: danSizes.defaultSpace,
        child: TextButton(
          child: const Text(
            'Skip',
            // style: TextStyle(color: Colors.red),
          ),
          onPressed: () => onboardingController.instance.skipPage(),
        ));
  }
}
