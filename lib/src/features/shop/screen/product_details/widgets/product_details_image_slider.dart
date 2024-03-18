import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/images_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/appbar_tabbar/appbar.dart';
import '../../../../../common/widgets/images/dan_rounded_images.dart';

class productDetailsImageSlider extends StatelessWidget {
  const productDetailsImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllproductImages(product);

    return curvedEdgesWidget(
        child: Container(
       color: isDark ? danColors.dark : danColors.white,
      child: Stack(
        children: [

          SizedBox(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(danSizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: danColors.primary,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const danAppBar(
            showBackArrow: true,
            actions: [
              Icon(
                Iconsax.heart5,
                color: Colors.red,
              )
            ],
          ),

          Positioned(
            bottom: 35,
            right: 0,
            left: danSizes.defaultSpace / 2,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(
                  width: danSizes.spacebtwItems,
                ),
                itemCount: images.length,
                itemBuilder: (_, index) => Obx(() {
                  final imageSelected =
                      controller.selectedProductImage.value == images[index];
                  return danRoundedImages(
                    isNetworkImage: true,
                    imageUrl: images[index],
                    onPressed: () =>
                        controller.selectedProductImage.value = images[index],
                    backgroundColor: isDark ? danColors.dark : danColors.white,
                    padding: EdgeInsets.zero,
                    border: Border.all(color: imageSelected ?  danColors.primary : Colors.transparent),
                    width: 80,
                  );
                }),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
