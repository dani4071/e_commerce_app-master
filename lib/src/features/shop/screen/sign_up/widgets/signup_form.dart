import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'terms_and_condition_checkbox.dart';
import '../../../../../common/widgets_login_signup/form_divider.dart';
import '../../../../../common/widgets_login_signup/social_buttons.dart';
import '../../../../authentication/controllers.onboarding/signup/signup_controller.dart';

class danSignUpForm extends StatelessWidget {
  const danSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = Get.put(SignupController());
    const spacebtwitem = SizedBox(
      height: danSizes.spacebtwItems,
    );

    return Form(
      key: controller.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            danTexts.signUpTitle,
            style: textTheme.headlineMedium,
          ),
          spacebtwitem,
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller.firstName,
                validator: (value) =>
                    danValidator.validateEmptyText("First Name", value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: danTexts.firstname,
                  prefixIcon: Icon(Iconsax.user),
                ),
              )),
              const SizedBox(
                width: danSizes.spacebtwInputFields,
              ),
              Expanded(
                  child: TextFormField(
                controller: controller.lastName,
                validator: (value) =>
                    danValidator.validateEmptyText("Last Name", value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: danTexts.lastname,
                  prefixIcon: Icon(Iconsax.user),
                ),
              )),
            ],
          ),
          spacebtwitem,
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                danValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: const InputDecoration(
              labelText: danTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          spacebtwitem,
          TextFormField(
            controller: controller.email,
            validator: (value) => danValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: danTexts.email,
              prefixIcon: Icon(Iconsax.message),
            ),
          ),
          const SizedBox(
            height: danSizes.spacebtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => danValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: danTexts.phoneNumber,
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(
            height: danSizes.spacebtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => danValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: danTexts.password,
                prefixIcon: const Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Icons.remove_red_eye),
                    onPressed: () {
                      controller.hidePassword.value =
                          !controller.hidePassword.value;
                    }),
              ),
            ),
          ),
          spacebtwitem,
          const danTermsAndCondition(),
          spacebtwitem,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
              // onPressed: () => Get.to(() => verifyEmailScreen(email: "emaidlldklds.com")),
                // onPressed: () => Get.to(successScreen(
                //   title: "daniel",
                //   subtitle: "bbsasjdjis",
                //   image: danImage.loadingImage2,
                //   onpress: (){},
                // )),
                child: Text(
                  danTexts.createAccount,
                  style: textTheme.bodyMedium!.apply(color: Colors.white),
                )),
          ),
          spacebtwitem,
          formDivider(isdark: isDark, texttheme: textTheme),
          spacebtwitem,
          const danSocialsButton(),
        ],
      ),
    );
  }
}
