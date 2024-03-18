import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';


class danSortableProducts extends StatelessWidget {
  const danSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          items: ["items", "body", "spotys", "clothe"]
              .map((option) =>
              DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(
          height: danSizes.spacebtwItems,
        ),
        danGridLayout(
            itemBuilder: (_, index) =>  danProductCardVertical(product: ProductModel.empty(),),
            itemCount: 8)
      ],
    );
  }
}