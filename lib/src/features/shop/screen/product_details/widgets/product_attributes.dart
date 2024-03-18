import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/widgets/choice_chip/choice_chip.dart';

class productAttributes extends StatelessWidget {
  const productAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;

    return Column(
      children: [
        danCircularContainer(
          width: double.infinity,
          backgroundcolor: isDark ? danColors.darkerGrey : Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(danSizes.md),
            child: Column(
              children: [
                Row(
                  children: [
                    danSectionHeading(
                      title: "Vacation",
                      showbutton: false,
                      texttheme: texttheme,
                    ),
                    const SizedBox(
                      width: danSizes.spacebtwItems / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const danProductTitleText(title: "Price:"),
                            const SizedBox(
                              width: danSizes.spacebtwItems / 2,
                            ),
                            Text(
                              "\$25",
                              style: texttheme.bodyMedium!.apply(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(
                              width: danSizes.spacebtwItems / 2,
                            ),
                            const danProductPriceText(price: "343")
                          ],
                        ),
                        const Row(
                          children: [
                            danProductTitleText(title: "Stock:"),
                            SizedBox(
                              width: danSizes.spacebtwItems / 2,
                            ),
                            danProductTitleText(title: "Out of Stock"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const danProductTitleText(
                    title:
                        "this is the description and it can go up to 4 max line and could go up more",
                    maxline: 2,
                    smallSize: true),
              ],
            ),
          ),
        ),


        const SizedBox(
          height: danSizes.spacebtwItems,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              danSectionHeading(texttheme: texttheme, title: attribute.name ?? ""),
              const SizedBox(
                height: danSizes.spacebtwItems / 2,
              ),
              Wrap(
                spacing: 2,
                children: attribute.values!.map((values) => danChoiceChip(text: values, selected: false, onSelected: (values){},),).toList(),
              ),

            ],
          ),).toList(),
        ),
      ],
    );
  }
}


