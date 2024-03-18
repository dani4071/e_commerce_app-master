import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/widgets/remember_me.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../sign_up/sign_up_screen.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = Get.put(loginController());

    return Form(
      key: controller.loginKey,
      child: Column(
        children: [
          // const formField(text: danTexts.email, pIcon: Iconsax.direct_right),
          TextFormField(
            controller: controller.email,
            validator: (value) => danValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: danTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(
            height: danSizes.spacebtwInputFields,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => danValidator.validateEmptyText("password", value),
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              decoration: InputDecoration(
                labelText: danTexts.password,
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    }),
              ),
            ),
          ),
          const danRememberMe(),
          const SizedBox(
            height: danSizes.spacebtwsections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signInWithEmailandPassword(),
                  child: const Text('Sign In'))),
          const SizedBox(
            height: danSizes.spacebtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              child: const Text('Create Account'),
              onPressed: () {
                Get.to(() => const signUpScreen());
              },
            ),
          ),
          const SizedBox(
            height: danSizes.spacebtwsections,
          ),
        ],
      ),
    );
  }
}
