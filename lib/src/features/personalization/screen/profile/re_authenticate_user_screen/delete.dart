import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class reAuthUserLoginFormScreen extends StatelessWidget {
  const reAuthUserLoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const danAppBar(
        showBackArrow: true,
        title: Text("Re-Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
              child: Column(
            children: [
              TextFormField(
                expands: false,
                controller: controller.verifyEmail,
                validator: (value) => danValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                ),
              ),
              const SizedBox(
                height: danSizes.spacebtwInputFields,
              ),
              Obx(
                ()=> TextFormField(
                  expands: false,
                  controller: controller.verifyPassword,
                  validator: (value) => danValidator.validateEmptyText("password", value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.fingerprint),
                    labelText: "Password",
                    suffixIcon: IconButton(
                        icon: Icon(controller.hidePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                      ),

                  ),
                ),
              ),
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Verify"),
                  onPressed: () => controller.reAuthenticateEmailandPassword(),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
