import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text_and_verified_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../icons/dan_circular_icon.dart';

class danProductCardHorizontal extends StatelessWidget {
  const danProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return Container(
      width: 310,
      height: 120,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(danSizes.borderRadiusLg),
        // boxShadow: [danShadowStyle.horizontalProductShadow],
        color: isDark ? danColors.dark : danColors.softGrey,
      ),
      child: Row(
        children: [
          danCircularContainer(
            height: 172,
            padding: EdgeInsets.zero,
            backgroundcolor: isDark ? danColors.dark : danColors.white,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: danRoundedImages(
                    imageUrl: danImage.imageNft,
                    applyImageRadius: true,
                    padding: EdgeInsets.zero,
                  ),
                ),
                Positioned(
                  top: 5,
                  child: danCircularContainer(
                    backgroundcolor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: danSizes.sm, vertical: danSizes.xs),
                    child: Text(
                      "33%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
                const Positioned(
                    right: 0,
                    top: 0,
                    child: danCircularIcon(
                      iconn: Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: danSizes.sm, left: danSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      danProductTitleText(
                        title:
                            "Not your airpods kindly connect and okay",
                        smallSize: true,
                        maxline: 2,
                      ),

                      SizedBox(height: danSizes.spacebtwItems / 2,),


                      // Spacer(),
                      danBrandTitleTextWithVerifiedIcon(title: "Nike"),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: danProductPriceText(price: "124")),
                      Container(
                        decoration: const BoxDecoration(
                          color: danColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(danSizes.cardRadiusMd),
                            bottomRight: Radius.circular(danSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: danSizes.iconlg * 1.2,
                          height: danSizes.iconlg * 1.2,
                          child: Center(child: Icon(Icons.add, color: Colors.white,)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
