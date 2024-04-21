import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:e_commerce_app/src/features/shop/screen/all_products/all_product_screen.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmer_annimation_loading/horizontal_product_shimmer.dart';

class subCategoryScreen extends StatelessWidget {
  const subCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: danAppBar(
          showBackArrow: true,
          title: Text(
            // category.name,
            "Hereeeeee",
            style: texttheme.bodyLarge,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.sm),

          // banner
          child: Column(
            children: [
              const danRoundedImages(
                imageUrl: danImage.onboardingImage6,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),

              // sub category
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// handle loader, no record, or error message
                    const loader = danHorizontalProductShimmer();
                    final widget =
                        danCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;

                    /// congratulation records found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];

                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              /// handle loader, no record, or error message
                              final widget =
                                  danCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: loader,
                              );
                              if (widget != null) return widget;

                              /// congratulation records found
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  // heading
                                  danSectionHeading(
                                    texttheme: texttheme,
                                    title: subCategory.name,
                                    showbutton: true,
                                    onPressed: () =>
                                        Get.to(() => allProductsScreen(
                                              title: subCategory.name,
                                              futureMethod: controller
                                                  .getCategoryProducts(
                                                      categoryId:
                                                          subCategory.id,
                                                      limit: -1),
                                            )),
                                  ),
                                  const SizedBox(
                                    height: danSizes.spacebtwItems,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          danProductCardHorizontal(
                                        product: products[index],
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: danSizes.spacebtwItems,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: danSizes.spacebtwsections,
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
