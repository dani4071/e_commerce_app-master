import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/features/shop/controller/banner_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import '../../../../../common/custom_shapes/containers/circular_container.dart';




class danPromoSlider extends StatelessWidget {
  const danPromoSlider({super.key,
    // required this.bannners
  });

  // final List<String> bannners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(bannerController());
    return Obx(
        () {
          
          // Loader
          if(controller.isLoading.value) return const danShimmerEffect(width: double.infinity, height: 190);

          // No data found
          if(controller.banners.isEmpty) {
            return const Center(child: Text('No Data found'),);
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, context) =>
                          controller.updatePageIndicator(index),
                    ),
                    items: controller.banners
                        .map((banner) => danRoundedImages(
                      imageUrl: banner.imageUrl, isNetworkImage: true, onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: danSizes.spacebtwItems,),
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        danCircularContainer(
                          backgroundcolor: controller.carouselCurrentIndex.value == i
                              ? danColors.primary
                              : Colors.grey,
                          width: 24,
                          height: 5,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                    ],
                  ),
                )
              ],
            );
          }
        } 
        
    );
  }
}