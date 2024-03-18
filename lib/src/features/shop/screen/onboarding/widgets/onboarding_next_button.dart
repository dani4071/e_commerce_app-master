import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/device/device_utility.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class nextButton extends StatelessWidget {
  const nextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = danHelperFunction.isDarkMode(context);
    return Positioned(
        bottom: danDeviceUtils.getBottomNavigationBarHeight() - 25,
        right: danSizes.defaultSpace - 9,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? danColors.primary : danColors.dark),
            onPressed: () => onboardingController.instance.nextPage(),
            child: const Icon(Iconsax.arrow_right_3,)));
  }
}