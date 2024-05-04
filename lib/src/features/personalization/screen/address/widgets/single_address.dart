import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/address_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class danSinglAddress extends StatelessWidget {
  const danSinglAddress({
    super.key,
    required this.address,
    required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final texttheme = Theme
        .of(context)
        .textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    const screenWidth = danHelperFunction.screenWidth;
    const screenHeight = danHelperFunction.screenHeight;

    return Obx(() {

      // video 50 -- 11:45
      // this just creates a bool to check if selected address matches the address we get from the previous screen that way it could know if its meant to be selected or not
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;

      return InkWell(
        onTap: onTap,
        child: danCircularContainer(
          padding: const EdgeInsets.all(danSizes.defaultSpace),
          backgroundcolor: selectedAddress
              ? danColors.primary.withOpacity(0.6)
              : Colors.transparent,
          width: double.infinity,
          showBorder: true,
          borderColor: selectedAddress
              ? Colors.transparent
              : isDark
              ? danColors.darkerGrey
              : danColors.primary,
          margin: const EdgeInsets.only(bottom: danSizes.defaultSpace),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? isDark
                      ? danColors.white
                      : danColors.black
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: texttheme.titleLarge,
                  ),
                  const SizedBox(
                    height: danSizes.spacebtwItems / 2,
                  ),
                  Text(
                    address.phoneNumber,
                    style: texttheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: danSizes.spacebtwItems / 2,
                  ),
                  Text(
                    address.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: texttheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    );
  }
}
