import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../common/widgets/section_heading/section_heading.dart';

class danCategoryTab extends StatelessWidget {
  const danCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            children: [
              danBrandShowCase(
                images: const [
                  danImage.onboardingImage4,
                  danImage.onboardingImage4,
                  danImage.onboardingImage4
                ],
                texttheme: texttheme,
              ),

              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              danSectionHeading(
                texttheme: texttheme,
                title: "You might like",
                title2: "View all",
                showbutton: true,
                padding: EdgeInsets.zero,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              danGridLayout(
                  itemBuilder: (_, index) => danProductCardVertical(product: ProductModel.empty(),),
                  itemCount: 4),
              // const SizedBox(
              //   height: danSizes.spacebtwsections,
              // ),
            ],
          )),
      ]
    );
  }
}
