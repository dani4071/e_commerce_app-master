import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class danTermsAndCondition extends StatelessWidget {
  const danTermsAndCondition({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(
                ()=> Checkbox(
                  value: controller.privacyPolicy.value,
                  checkColor: Colors.white,
                  onChanged: (value) {
                    controller.privacyPolicy.value = !controller.privacyPolicy.value;
                  }),
            )),
        Text.rich(TextSpan(children: [
          const TextSpan(text: ' ${danTexts.iAgreeTo} '),
          TextSpan(
              text: '${danTexts.privacyPolicy} ',
              style: textTheme.bodyMedium!
                  .apply(decoration: TextDecoration.underline)),
          const TextSpan(text: 'and '),
          TextSpan(
              text: '${danTexts.termsOfUse}.',
              style: textTheme.bodyMedium!
                  .apply(decoration: TextDecoration.underline)),
        ]))
      ],
    );
  }
}