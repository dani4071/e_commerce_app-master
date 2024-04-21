import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/src/common/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/brand_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/brand_model.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class brandProduct extends StatelessWidget {
  const brandProduct({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: danAppBar(title: Text(brand.name, style: texttheme.bodyLarge,), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace / 2),
          child: Column(
            children: [
              danBrandCard(showBorder: true, brand: brand,),
              const SizedBox(height: danSizes.defaultSpace,),


              FutureBuilder(
                future: brandController.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  /// handle loader, No record, Or error message
                  const loader = danVerticalProductShimmer();
                  final widget = danCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found!
                  final brandProducts = snapshot.data!;
                  return danSortableProducts(products: brandProducts);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
