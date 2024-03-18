import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/widgets/buttom_add_to_cart_for_products.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/widgets/product_details_image_slider.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/widgets/product_rating_share.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/review_screen.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class productScreen extends StatelessWidget {
  const productScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenWidth();
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: const danButtomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            productDetailsImageSlider(product: product,),

            Padding(
              padding: const EdgeInsets.only(
                  left: danSizes.defaultSpace,
                  right: danSizes.defaultSpace,
                  bottom: danSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  const ratingAndShare(),

                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),


                  productMetaData(product: product,),

                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),

                  if(product.productType == ProductType.variable.toString())  productAttributes(product: product,),


                  if(product.productType == ProductType.variable.toString())  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Check-Out"))),

                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),

                  danSectionHeading(
                    texttheme: texttheme,
                    title: "Description",
                    padding: EdgeInsets.zero,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Show Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      danSectionHeading(
                        texttheme: texttheme,
                        title: "Reviews (166)",
                        padding: EdgeInsets.zero,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_sharp),
                        onPressed: () => Get.to(const productReviewScreen()),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
