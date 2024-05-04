import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/product_details/product_screen.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/product_model.dart';

class productCartAddToCartButton extends StatelessWidget {
  const productCartAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return GestureDetector(
      onTap: () {
        // if the  product have variations then show the product details for variation selection
        // else add product to the cart.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneItemToCart(cartItem);
        } else {
          Get.to(() => productScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color:
                productQuantityInCart > 0 ? danColors.primary : danColors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(danSizes.cardRadiusMd),
              bottomRight: Radius.circular(danSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: danSizes.iconlg * 1.2,
            height: danSizes.iconlg * 1.2,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: Colors.white),
                      )
                    : const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
          ),
        );
      }),
    );
  }
}
