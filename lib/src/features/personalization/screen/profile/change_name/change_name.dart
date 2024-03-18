import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/change_name_controller/change_name_contoller2.dart';
import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/change_name_controller/change_name_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class changeNameScreen extends StatelessWidget {
  const changeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textheme = Theme.of(context).textTheme;
    final controller = Get.put(updateNameController());
    final controller2 = Get.put(updateNameController2());

    return Scaffold(
      appBar: danAppBar(
          title: Text(
            "Change Name",
            style: textheme.bodyMedium,
          ),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace / 2),
          child: Column(
            children: [
              Text(
                danTexts.changeNameDescription,
                style: textheme.bodyMedium,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              Form(
                  key: controller2.upateNameKey2,
                  child: Column(
                children: [
                  TextFormField(
                    validator: (value) => danValidator.validateEmptyText("First Name", value),
                    expands: false,
                    controller: controller2.firstname2,
                    decoration: const InputDecoration(
                      labelText: "First Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: danSizes.spacebtwInputFields,),
                  TextFormField(
                    validator: (value) => danValidator.validateEmptyText("Last Name", value),
                    controller: controller2.lastname2,
                    decoration: const InputDecoration(
                      labelText: "Last Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: danSizes.spacebtwsections,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () => controller2.updateUserName2(),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
