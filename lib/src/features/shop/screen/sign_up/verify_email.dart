import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/signup/verify_email_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class verifyEmailScreen extends StatelessWidget {
  const verifyEmailScreen({super.key, this.email});


  final String? email;

  @override
  Widget build(BuildContext context) {

    ///immediately they initialized the the email controller the timer starts checking
    final controller = Get.put(verifyEmailController());
    final authcontroller = Get.put(AuthenticationRepository());
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    const spacebtwitems = SizedBox(height: danSizes.spacebtwItems);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => authcontroller.logoutUser(),
            icon: const Icon(CupertinoIcons.clear),
            color: isDark ? danColors.white : danColors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.spacebtwsections),
          child: Column(
            children: [
              Image(
                image: const AssetImage(danImage.onboardingImage4),
                width: danHelperFunction.screenWidth() * 0.6,
              ),
              Text(
                danTexts.confirmEmail,
                style: texttheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              spacebtwitems,
              Text(
                email ?? '',
                style: texttheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              spacebtwitems,
              Text(
                danTexts.confirmEmailSubTitle,
                style: texttheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(danTexts.continuee))),
              spacebtwitems,
              TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text("Resend E-mail")),
            ],
          ),
        ),
      ),
    );
  }
}
