import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/src/utils/validator/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class danAddNewAddress extends StatelessWidget {
  const danAddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    const screenWidth = danHelperFunction.screenWidth;
    const screenHeight = danHelperFunction.screenHeight;
    final controller = AddressController.instance;

    return Scaffold(
      appBar: danAppBar(
        showBackArrow: true,
        title: Text("Add New Address", style: texttheme.bodyMedium,),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => danValidator.validateEmptyText("Name", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => danValidator.validatePhoneNumber(value),
                  // validator: danValidator.validatePhoneNumber(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: "Phone Number",
                  ),
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => danValidator.validateEmptyText("Street", value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: "Street",
                        ),
                      ),
                    ),
                    const SizedBox(width: danSizes.spacebtwItems,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => danValidator.validateEmptyText("Postal Code", value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: "Postal Code",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => danValidator.validateEmptyText("Postal Code", value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: "City",
                        ),
                      ),
                    ),
                    const SizedBox(width: danSizes.spacebtwItems,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: "State",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                TextFormField(
                  controller: controller.country,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: "Country",
                  ),
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      controller.addNewAddress();
                    }, child: const Text("Save")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
