import 'package:e_commerce_app/src/common/widgets/products/carts/cart_menu_icon.dart';
import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/tab_bar.dart';
import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/seachBar/search_bar.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/brand_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/brand_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/brand/all_brands.dart';
import 'package:e_commerce_app/src/features/shop/screen/brand/brand_product.dart';
import 'package:e_commerce_app/src/features/shop/screen/store/widgets/categoryTab.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar_tabbar/appbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';

class storeScreen extends StatelessWidget {
  const storeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    final screenheight = danHelperFunction.screenHeight();
    final categoriesController = CategoryController.instance.popularCategories;
    // final categoriesController = categotyController.popularCategories;
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categoriesController.length,
      child: Scaffold(
        appBar: danAppBar(
          title: Text("Store", style: texttheme.headlineMedium),
          actions: [
            danCounterIcon(
                texttheme: texttheme,
                iconColor: isDark ? danColors.white : danColors.dark,
                onpressed: () {})
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isDark ? Colors.red : Colors.green,
                  expandedHeight: 420,
                  flexibleSpace: Padding(
                    //padding: const EdgeInsets.all(danSizes.defaultSpace / 2),
                    padding: const EdgeInsets.all(danSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: danSizes.spacebtwItems * 2,
                        ),
                        danSearchBar(
                            screenHeight: screenheight,
                            padding: EdgeInsets.zero),
                        const SizedBox(
                          height: danSizes.spacebtwsections,
                        ),
                        danSectionHeading(
                          texttheme: texttheme,
                          title: "Featured Brands",
                          title2: "View all",
                          showbutton: true,
                          padding: EdgeInsets.zero,
                          onPressed: () => Get.to(() => const allBrandScreen()),
                        ),
                        // const SizedBox(
                        //   height: danSizes.spacebtwItems,
                        // ),

//LATER FIGURE OUT HOW TO DEAL WITH mainAxisExtent: 0.10 ON THIS GRID LAYOUT
                        /// -- Brands Grid

                        Obx(() {
                          if (brandController.isLoading.value) {
                            return const danBrandShimmer();
                          }

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(
                                'No Data Found',
                                style: texttheme.bodyMedium!
                                    .apply(color: Colors.white),
                              ),
                            );
                          }

                          return danGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 0.08,
                            itemBuilder: (_, index) {
                              final brand =
                                  brandController.featuredBrands[index];
                              return danBrandCard(
                                showBorder: true,
                                brand: brand,
                                onPressed: () => Get.to(() => brandProduct(
                                      brand: brand,
                                    )),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  bottom: danTabbar(
                      tabs: categoriesController
                          .map((category) => Tab(
                                child: Text(
                                  category.name,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: categoriesController
                    .map((category) => danCategoryTab(
                          category: category,
                        ))
                    .toList())
        ),
      ),
    );
  }
}
