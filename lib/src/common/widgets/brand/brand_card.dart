import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../custom_shapes/containers/circular_container.dart';
import '../images/dan_circular_image.dart';
import '../texts/brand_title_text_and_verified_icon.dart';

class danBrandCard extends StatelessWidget {
  const danBrandCard({
    super.key,
    required this.showBorder,
    this.onPressed,
  });

  final bool showBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {


    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);


    return GestureDetector(
      onTap: onPressed,
      child: danCircularContainer(
        padding: const EdgeInsets.all(danSizes.sm),
        showBorder: showBorder,
        backgroundcolor: Colors.transparent,
        child: Row(
          children: [
            const Flexible(
              child: danCircularImage(
                isNetworkImage: false,
                image: danImage.facebook,
                backgroundcolor: Colors.transparent,
                // overlayColor: isDark ? danColors.white : danColors.dark,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const danBrandTitleTextWithVerifiedIcon(
                    title: "Nike",
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    "256 Products",
                    overflow: TextOverflow.ellipsis,
                    style: texttheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
