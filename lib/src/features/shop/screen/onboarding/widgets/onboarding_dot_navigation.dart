import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/src/utils/device/device_utility.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';

class onboardingDotNavigation extends StatelessWidget {
  const onboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = onboardingController.instance;
    final dark = danHelperFunction.isDarkMode(context);

    return Positioned(
        bottom: danDeviceUtils.getBottomNavigationBarHeight() - 21,
        left: danSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.updatePageIndicator,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: danColors.dark, dotHeight: 5),

        ));
  }
}