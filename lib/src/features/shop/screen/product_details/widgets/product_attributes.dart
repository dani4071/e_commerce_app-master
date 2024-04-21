import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/choice_chip/choice_chip.dart';

class productAttributes extends StatelessWidget {
  const productAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    final controller = Get.put(VariationController());

    return Obx(
      () => Column(
        children: [


          /// -- selected attribute pricing and description
          // display variation price and stock when some variation is selected

          //if(controller.selectedVariation.value.id.isNotEmpty)
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
                              const danProductTitleText(title: "Price: "),
                              const SizedBox(
                                width: danSizes.spacebtwItems / 2,
                              ),

                              // Actual price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                "\$${controller.selectedVariation.value.price}",
                                style: texttheme.bodyMedium!.apply(
                                    decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: danSizes.spacebtwItems / 2,
                              ),
                              danProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const danProductTitleText(title: "Stock: "),
                              const SizedBox(
                                width: danSizes.spacebtwItems / 2,
                              ),
                              Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  danProductTitleText(
                      title: controller.selectedVariation.value.description ?? "",
                      maxline: 2,
                      smallSize: true),
                ],
              ),
            ),
          ),


          const SizedBox(
            height: danSizes.spacebtwItems,
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) =>  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                danSectionHeading(texttheme: texttheme, title: attribute.name ?? ""),
                const SizedBox(
                  height: danSizes.spacebtwItems / 2,
                ),
                Obx(
                  () => Wrap(
                    spacing: 2,
                    children: attribute.values!.map((attributeValue) {

                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final avaialble = controller.getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!
                      ).contains(attributeValue);

                      return danChoiceChip(text: attributeValue, selected: isSelected, onSelected: avaialble ? (selected){
                        if (selected && avaialble){
                          controller.onAttributeSelected(product, attribute.name ?? "", attributeValue);
                        }
                      } : null
                      );}).toList(),
                  ),
                ),
              ],
            ),).toList(),
          ),
        ],
      ),
    );
  }
}


