import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/common/widgets/icons/dan_circular_icon.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class danProductQualityWithAddRemove extends StatelessWidget {
  const danProductQualityWithAddRemove({
    super.key,
  });


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
        ),

        const SizedBox(width: danSizes.spacebtwItems),
        Text("2", style: texttheme.bodyMedium,),
        const SizedBox(width: danSizes.spacebtwItems),

        danCircularIcon(
          iconn: Icons.add,
          height: 32,
          width: 32,
          size: danSizes.md,
          color: isDark ? danColors.white : danColors.black,
          backGroundColor: isDark ? danColors.darkerGrey : danColors.primary,
        ),
      ],
    );
  }
}