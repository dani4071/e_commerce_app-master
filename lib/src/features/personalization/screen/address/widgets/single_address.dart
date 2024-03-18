import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class danSinglAddress extends StatelessWidget {
  const danSinglAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    const screenWidth = danHelperFunction.screenWidth;
    const screenHeight = danHelperFunction.screenHeight;

    return danCircularContainer(
      padding: const EdgeInsets.all(danSizes.defaultSpace),
      backgroundcolor: selectedAddress ? danColors.primary.withOpacity(0.6) : Colors.transparent,
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
                "Coding with dan",
                style: texttheme.titleLarge,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems / 2,
              ),
              Text(
                "+23435666353",
                style: texttheme.bodyMedium,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems / 2,
              ),
              Text(
                "2343 Tiemmmy convers eke street ogbete enugu coal camp Enugu state USA",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: texttheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
