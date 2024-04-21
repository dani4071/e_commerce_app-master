import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/box_shimmer.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/list_tile_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/brand_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme
        .of(context)
        .textTheme;
    final controller = BrandController.instance;

    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // Handle loader, no record, or error message
          const loader = Column(
            children: [
              danListTileShimmer(),
              SizedBox(height: danSizes.spacebtwItems,),
              danBoxesShimmer(),
              SizedBox(height: danSizes.spacebtwItems,),
            ],
          );

          final widget = danCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;


          // Record found!
          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: brands.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index){
              final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = danCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                /// Record found!
                final products = snapshot.data!;

                return danBrandShowCase(texttheme: texttheme, brand: brand, images: products.map((e) => e.thumbnail).toList(),);
              }
            );
            },

          );
        }
    );
  }
}
