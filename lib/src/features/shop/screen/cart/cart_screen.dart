import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/widget/cart_items.dart';
import 'package:e_commerce_app/src/features/shop/screen/checkout/checkout_screen.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenHeight();
    final isDark = danHelperFunction.isDarkMode(context);
    final cartController = CartController.instance;

    return Scaffold(
      appBar: const danAppBar(title: Text("Cart"), showBackArrow: true),
      body: Obx(() {
        // Nothing found in the cart widget
        final emptyWidget = danAnimationLoaderWidget(
          text: "Whoops! cart is empty",
          animation: danImage.pencilAnimation,
          showAction: true,
          actionText: 'Let\'s fill it shall we?',
          onActionPresed: () => Get.off(() => const navigationMenu()),
        );

        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(danSizes.defaultSpace),

              /// -- Items in cart
              child: cardItems(),
            ),
          );
        }

        // return const SingleChildScrollView(
        //   child: Padding(
        //     padding: EdgeInsets.all(danSizes.defaultSpace),
        //
        //     /// -- Items in cart
        //     child: cardItems(),
        //   ),
        // );
      }),

      /// checkout button
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(danSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(const checkOutScreen()),
                  child: Obx(
                    () => Text(
                        "Check-out \$${cartController.totalCartPrice.value.toStringAsFixed(2)}"),

                  )),
            ),
    );
  }
}
