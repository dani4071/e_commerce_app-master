import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/password_configuration/forget_password.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class danRememberMe extends StatelessWidget {
  const danRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = loginController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                  value: controller.rememberMe.value,
                  checkColor: danColors.white,
                  onChanged: (value) {
                    controller.rememberMe.value = !controller.rememberMe.value;
                  }),
            ),
            const Text(danTexts.rememberMe),
          ],
        ),
        TextButton(
            onPressed: () => Get.to(() => const forgetPasswordScreen()), child: const Text(danTexts.forgotPassword)),
      ],
    );
  }
}
