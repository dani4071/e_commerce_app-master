import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_app/src/features/shop/screen/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce_app/src/features/shop/screen/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_app/src/features/shop/screen/onboarding/widgets/onboarding_skip_button.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(onboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                image: danImage.onboardingImage5,
                title: danTexts.onboardingTitle1,
                subtitle: danTexts.onboardingSubtitle1,
              ),
              onBoardingPage(
                image: danImage.onboardingImage4,
                title: danTexts.onboardingTitle2,
                subtitle: danTexts.onboardingSubtitle2,
              ),
              onBoardingPage(
                image: danImage.onboardingImage3,
                title: danTexts.onboardingTitle3,
                subtitle: danTexts.onboardingSubtitle3,
              ),
            ],
          ),
          const buttonSkip(),
          const onboardingDotNavigation(),
          const nextButton()
        ],
      ),
    );
  }
}
