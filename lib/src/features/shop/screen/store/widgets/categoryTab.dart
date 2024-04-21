import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:e_commerce_app/src/features/shop/screen/all_products/all_product_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/store/widgets/category_brands.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/section_heading/section_heading.dart';

class danCategoryTab extends StatelessWidget {
  const
  danCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                children: [
                  CategoryBrands(category: category),

                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),
                  FutureBuilder(
                      future: controller.getCategoryProducts(
                          categoryId: category.id),
                      builder: (context, snapshot) {
                        final response =
                            danCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: const danVerticalProductShimmer());
                        if (response != null) return response;

                        final product = snapshot.data!;

                        return Column(
                          children: [
                            danSectionHeading(
                              texttheme: texttheme,
                              title: "You might like",
                              title2: "View all",
                              showbutton: true,
                              padding: EdgeInsets.zero,
                              onPressed: () => Get.to(allProductsScreen(
                                title: category.name,
                                futureMethod: controller.getCategoryProducts(
                                    categoryId: category.id, limit: -1),
                              )),
                            ),
                            const SizedBox(
                              height: danSizes.spacebtwItems,
                            ),
                            danGridLayout(
                                itemBuilder: (_, index) =>
                                    danProductCardVertical(
                                      product: product[index],
                                    ),
                                itemCount: product.length),
                          ],
                        );
                      }),

                  // const SizedBox(
                  //   height: danSizes.spacebtwsections,
                  // ),
                ],
              )),
        ]);
  }
}
