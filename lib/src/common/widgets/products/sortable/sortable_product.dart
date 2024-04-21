import 'package:e_commerce_app/src/features/shop/controller/product/all_product_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class danSortableProducts extends StatelessWidget {
  const danSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);

    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          items: ["Name", "Higher Price", "Lower Price", "Sale", "Newest",]
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(
          height: danSizes.spacebtwItems,
        ),

        Obx(
          ()=> danGridLayout(
              itemBuilder: (_, index) =>  danProductCardVertical(product: controller.products[index],),
              itemCount: controller.products.length),
        )
      ],
    );
  }
}