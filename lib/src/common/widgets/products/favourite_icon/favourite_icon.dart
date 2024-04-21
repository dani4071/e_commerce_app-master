import 'package:e_commerce_app/src/common/widgets/icons/dan_circular_icon.dart';
import 'package:e_commerce_app/src/common/widgets/products/favourite_icon/faavourite_icon_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class danFavouriteIcon extends StatelessWidget {
  const danFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FavouriteController());
    return Obx(
      () => danCircularIcon(
        iconn: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? danColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
