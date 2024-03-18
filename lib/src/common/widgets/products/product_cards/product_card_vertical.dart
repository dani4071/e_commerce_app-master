import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/styles/shadows.dart';
import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text_and_verified_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/product_screen.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/shop/model/product_model.dart';
import '../../icons/dan_circular_icon.dart';
import '../../images/dan_rounded_images.dart';
import '../../texts/product_title_text.dart';

class danProductCardVertical extends StatelessWidget {
  const danProductCardVertical({super.key, required this.product});


  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = danHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => productScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [danShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(danSizes.productImageRadius),
          color: isDark ? danColors.darkGrey : danColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            danCircularContainer(
              height: 190,
              width: 190,
              // padding: const EdgeInsets.all(0),
              backgroundcolor: isDark ? danColors.dark : danColors.primary,
              child: Stack(
                children: [

                  //thumbnail image
                  Center(
                    child: danRoundedImages(
                      imageUrl: product.thumbnail,
                      height: 190,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 5,
                    child: danCircularContainer(
                      // backgroundcolor: danColors.secondary.withOpacity(0.8),
                      backgroundcolor: Colors.red,
                      radius: danSizes.sm,
                      height: 25,
                      width: 44,
                      padding: const EdgeInsets.symmetric(
                          horizontal: danSizes.sm, vertical: danSizes.xs),
                      child: Center(
                          child: Text(
                        "$salePercentage%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.white),
                      )),
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



            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   danProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: danSizes.spacebtwItems / 2,
                  ),
                  // const danBrandTitleText(title: 'Nike',),


                  danBrandTitleTextWithVerifiedIcon(title: product.brand!.name,),
                  const SizedBox(
                    height: danSizes.spacebtwItems / 2,
                  ),


                  // price row
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

            // Spacer(),
            // YOU CAN ONLY USE SPACER WHEN YOU GIVE IT A FIXED HEIGHT, IM STILL FIGURING HOW TO GIVE THIS FIXED HEIGHT
          ],
        ),
      ),

    );
  }
}

