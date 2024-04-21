import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/brand_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/brand/brand_product.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmer_annimation_loading/brand_shimmer.dart';

class allBrandScreen extends StatelessWidget {
  const allBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: danAppBar(
          showBackArrow: true,
          title: Text(
            "Brands",
            style: texttheme.bodyLarge,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.sm),
          child: Column(children: [
            danSectionHeading(texttheme: texttheme, title: "brands"),
            const SizedBox(
              height: danSizes.spacebtwItems,
            ),
            Obx(
                    () {

                  if(brandController.isLoading.value) return const danBrandShimmer();

                  if (brandController.featuredBrands.isEmpty) {
                    return Center(
                      child: Text('No Data Found', style: texttheme.bodyMedium!.apply(color: Colors.white),),
                    );
                  }


                  return danGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 0.08,
                    itemBuilder: (_, index) {

                      final brand = brandController.allBrands[index];
                      return danBrandCard(
                        showBorder: true, brand: brand,
                        onPressed: () => Get.to(() => brandProduct(brand: brand,)),
                      );
                    },
                  );
                }
            ),
          ]),
        ),
      ),
    );
  }
}
