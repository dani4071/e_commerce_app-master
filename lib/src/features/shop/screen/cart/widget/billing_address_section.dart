import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class danBillingAddressSection extends StatelessWidget {
  const danBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final addressController = AddressController.instance;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          danSectionHeading(
            texttheme: texttheme,
            title: "Shipping Address",
            showbutton: true,
            title2: "Change",
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),

          //// was done to check if you've selected an address already
          addressController.selectedAddress.value.id.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Coding with Dan", style: texttheme.bodyMedium,),
              const SizedBox(height: danSizes.spacebtwItems / 2,),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 26,),
                  const SizedBox(width: danSizes.spacebtwItems / 2,),
                  Text("+234-354-2234", style: texttheme.bodyMedium,)
                ],
              ),
              const SizedBox(height: danSizes.spacebtwItems / 2,),
              Row(
                children: [
                  const Icon(Icons.supervised_user_circle_rounded, color: Colors.grey, size: 26,),
                  const SizedBox(width: danSizes.spacebtwItems / 2,),
                  Expanded(child: Text("South linee, maine 6453, USA", style: texttheme.bodyMedium, softWrap: true,))
                ],
              ),

            ],
          ) : Text("Select Address", style: texttheme.bodyMedium,),
        ],
      ),
    );
  }
}
