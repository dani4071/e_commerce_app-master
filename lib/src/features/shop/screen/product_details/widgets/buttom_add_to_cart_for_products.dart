import 'package:e_commerce_app/src/common/widgets/icons/dan_circular_icon.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class danButtomAddToCart extends StatelessWidget {
  const danButtomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: danSizes.defaultSpace,
          vertical: danSizes.defaultSpace / 2
      ),
      decoration: BoxDecoration(
        color: isDark ? danColors.darkerGrey : danColors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(danSizes.cardRadiusLg),
          topLeft: Radius.circular(danSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const danCircularIcon(
                iconn: Iconsax.minus,
                backGroundColor: danColors.darkGrey,
                width: 40,
                height: 40,
                color: danColors.white,
              ),
              const SizedBox(
                width: danSizes.spacebtwItems,
              ),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: danSizes.spacebtwItems,
              ),
              const danCircularIcon(
                iconn: Icons.add,
                backGroundColor: danColors.black,
                width: 40,
                height: 40,
                color: danColors.white,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(danSizes.md),
              backgroundColor: Colors.black,
              side: const BorderSide(color: danColors.black)
            ),
            onPressed: () {},
              child: const Text("Add to cart"),
          )
        ],
      ),
    );
  }
}
