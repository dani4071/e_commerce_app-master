import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text_and_verified_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class danCardItem extends StatelessWidget {
  const danCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;

    return Row(
      children: [
        danRoundedImages(
          imageUrl: danImage.imageNft,
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(danSizes.sm),
          backgroundColor: isDark ? danColors.darkerGrey : danColors.Light,
        ),
        const SizedBox(width: danSizes.defaultSpace,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const danBrandTitleTextWithVerifiedIcon(title: "Nike"),
            const danProductTitleText(title: "Green Nike Sports shoe"),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "Color ", style: texttheme.bodySmall),
                      TextSpan(text: "Green ", style: texttheme.bodyLarge),
                      TextSpan(text: "Size ", style: texttheme.bodySmall),
                      TextSpan(text: "UK 08", style: texttheme.bodyLarge),
                    ]
                )

            ),
          ],
        )



      ],
    );
  }
}