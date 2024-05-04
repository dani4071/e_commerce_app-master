import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/common/widgets/icons/dan_circular_icon.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class danProductQualityWithAddRemove extends StatelessWidget {
  const danProductQualityWithAddRemove({
    super.key, required this.quantity, this.add, this.minus,
  });

  final int quantity;
  final VoidCallback? add, minus;


  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenHeight();
    final isDark = danHelperFunction.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        danCircularIcon(
          iconn: Iconsax.minus,
          height: 32,
          width: 32,
          size: danSizes.md,
          color: isDark ? danColors.white : danColors.black,
          backGroundColor: isDark ? danColors.darkerGrey : danColors.darkGrey,
          onPressed: minus,
        ),

        const SizedBox(width: danSizes.spacebtwItems),
        Text(quantity.toString(), style: texttheme.bodyMedium,),
        const SizedBox(width: danSizes.spacebtwItems),

        danCircularIcon(
          iconn: Icons.add,
          height: 32,
          width: 32,
          size: danSizes.md,
          color: isDark ? danColors.white : danColors.black,
          backGroundColor: isDark ? danColors.darkerGrey : danColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}