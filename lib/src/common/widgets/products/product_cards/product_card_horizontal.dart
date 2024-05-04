import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text_and_verified_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../features/shop/controller/product/product_controller.dart';
import '../../../../utils/contants/enums.dart';

class danProductCardHorizontal extends StatelessWidget {
  const danProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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

                /// thumbnail image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: danRoundedImages(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    padding: EdgeInsets.zero,
                    isNetworkImage: true,
                  ),
                ),


                /// sale tag
                if(salePercentage != null)
                Positioned(
                  top: 5,
                  child: danCircularContainer(
                    backgroundcolor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: danSizes.sm, vertical: danSizes.xs),
                    child: Text(
                      salePercentage,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: danFavouriteIcon(productId: product.id,)),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: danSizes.sm, left: danSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      danProductTitleText(
                        title: product.title,
                        smallSize: true,
                        maxline: 2,
                      ),

                      const SizedBox(height: danSizes.spacebtwItems / 2,),


                      // Spacer(),
                      danBrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType == ProductType.single.toString() && product.salePrice > 0 )
                              Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),)),


                            /// price show sale price as main price if sale exist
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: danProductPriceText(
                                price: controller.getProductPrice(product),
                              ),
                            ),
                          ],
                        ),
                      ),

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
