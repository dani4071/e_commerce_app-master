import 'package:e_commerce_app/src/common/widgets/icons/dan_circular_icon.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class danButtomAddToCart extends StatelessWidget {
  const danButtomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: danSizes.defaultSpace,
          vertical: danSizes.defaultSpace / 2
      ),
      decoration: BoxDecoration(
        color: isDark ? danColors.darkerGrey : danColors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(danSizes.cardRadiusLg),
          topLeft: Radius.circular(danSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 danCircularIcon(
                  iconn: Iconsax.minus,
                  backGroundColor: danColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: danColors.white,
                  onPressed: () => cartController.productQuantityInCart.value < 1 ? null : cartController.productQuantityInCart.value -= 1,

                ),
                const SizedBox(
                  width: danSizes.spacebtwItems,
                ),
                Text(
                  cartController.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: danSizes.spacebtwItems,
                ),
                danCircularIcon(
                  iconn: Icons.add,
                  backGroundColor: danColors.black,
                  width: 40,
                  height: 40,
                  color: danColors.white,
                  onPressed: () => cartController.productQuantityInCart += 1,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(danSizes.md),
                backgroundColor: Colors.black,
                side: const BorderSide(color: danColors.black)
              ),
              onPressed: cartController.productQuantityInCart.value < 1 ? null : () => cartController.addToCart(product),
                child: const Text("Add to cart"),
            )
          ],
        ),
      ),
    );
  }
}
