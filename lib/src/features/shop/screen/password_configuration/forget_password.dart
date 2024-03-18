import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordScreen extends StatelessWidget {
  const forgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final controller = Get.put(forgetPasswordController());

    return Scaffold(
      appBar:  danAppBar(showBackArrow: false, actions: [
        IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              danSectionHeading(
                texttheme: texttheme,
                title: "Forget Password",
                padding: EdgeInsets.zero,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              const Text(danTexts.forgotPasswordSubTitle),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              Form(
                key: controller.forgotPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: danValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.black,),
                  labelText: "E-mail",
                ),
              )),
              const SizedBox(
                height: danSizes.spacebtwInputFields,
              ),
              SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text("Submit"))),
            ],
          ),
        ),
      ),
    );
  }
}
