import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar_tabbar/appbar.dart';

class favouriteScreen extends StatelessWidget {
  const favouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: danAppBar(
          title: Text(
            "Wishlist",
            style: texttheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const navigationMenu());
                },
                icon: Icon(Icons.home, color: isDark ? Colors.white : Colors.black,))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: danGridLayout(
              itemBuilder: (_, index) => danProductCardVertical(product: ProductModel.empty()),
              itemCount: 6),
        ),
      ),
    );
  }
}
