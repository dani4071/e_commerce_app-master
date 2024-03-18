import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/all_products/all_product_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/home/widgets/home_app_bar.dart';
import 'package:e_commerce_app/src/features/shop/screen/home/widgets/home_promo_slider.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/seachBar/search_bar.dart';
import '../../../../common/widgets/section_heading/section_heading.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenWidth();
    final texttheme = Theme.of(context).textTheme;
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            danPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeAppBar(
                    texttheme: texttheme,
                    title: danTexts.homeAppBarTitle,
                    subtitle: "mandem",
                  ),
                  danSearchBar(screenHeight: screenHeight),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      danSectionHeading(
                          title: "Popular Brands", texttheme: texttheme),
                      const SizedBox(height: danSizes.spacebtwItems / 2,),
                     // const popularCategories(),
                    ],
                  ),
                  const SizedBox(
                    height: danSizes.spacebtwsections,
                  )
                ],
              ),
            ),


            const danPromoSlider(),


            const SizedBox(
              height: danSizes.spacebtwItems,
            ),

            danSectionHeading(
              texttheme: texttheme,
              title: "Popular Products",
              title2: "view all",
              showbutton: true,
              onPressed: () => Get.to(const allProductsScreen()),
            ),


            Obx(() {
              
              if(controller.isLoading.value) return const danVerticalProductShimmer();

              if(controller.featuredProducts.isEmpty) {return Center(child: Text("No Data Found!", style: texttheme.bodyMedium,),);}
              
              return danGridLayout(
                  itemBuilder: (_, index) => danProductCardVertical(product: controller.featuredProducts[index],),
                  itemCount: controller.featuredProducts.length);
            } 
            )
          ],
        ),
      ),
    );
  }
}
