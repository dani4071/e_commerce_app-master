import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/widget/cart_items.dart';
import 'package:e_commerce_app/src/features/shop/screen/checkout/checkout_screen.dart';
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

    return Scaffold(
      appBar: const danAppBar(title: Text("Cart"), showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(danSizes.defaultSpace),
          child: cardItems(),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(danSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(const checkOutScreen()), child: const Text("Chck-out \$256")),
      ),
    );
  }
}





