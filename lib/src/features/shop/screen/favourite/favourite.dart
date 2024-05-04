import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/src/common/widgets/products/favourite_icon/faavourite_icon_controller.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar_tabbar/appbar.dart';

class favouriteScreen extends StatelessWidget {
  const favouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme
        .of(context)
        .textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = Get.put(FavouriteController());


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
                icon: Icon(
                  Icons.home, color: isDark ? Colors.white : Colors.black,))
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Obx(
            () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  final emptyWidget = danAnimationLoaderWidget(
                    text: "Whoops! Wishlist is empty..",
                    animation: danImage.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPresed:  () => Get.off(() => const navigationMenu()),);

                  const loader = danVerticalProductShimmer(itemCount: 6,);
                  final widget = danCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;


                  final products = snapshot.data!;
                  return danGridLayout(
                      itemBuilder: (_, index) =>
                          danProductCardVertical(product: products[index]),
                      itemCount: products.length);
                }
            ),
          ),
        ),
      ),
    );
  }
}
