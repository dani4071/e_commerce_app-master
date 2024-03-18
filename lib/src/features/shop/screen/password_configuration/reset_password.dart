import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/login.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {

    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    const spacebtwitems = SizedBox(height: danSizes.spacebtwItems);
    final controller = Get.put(forgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
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
                danTexts.changePasswordTitle,
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
                danTexts.changePasswordSubTitle,
                style: texttheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const loginScreen()),
                      child: const Text(danTexts.done))),
              spacebtwitems,

              /// think you could put a timer to automatically check and redirect immediately
              TextButton(onPressed: () => controller.resendPasswordResetEmail(email),
                  child: const Text("Resend E-mail")),
            ],
          ),
        ),
      ),
    );
  }
}
