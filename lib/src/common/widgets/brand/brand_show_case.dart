import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/features/shop/model/brand_model.dart';
import 'package:e_commerce_app/src/features/shop/screen/brand/brand_product.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_shapes/containers/circular_container.dart';
import 'brand_card.dart';


class danBrandShowCase extends StatelessWidget {
  const danBrandShowCase({
    super.key,
    required this.texttheme,
    required this.images,
    required this.brand,
  });

  final TextTheme texttheme;
  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => brandProduct(brand: brand)),
      child: danCircularContainer(
        padding: const EdgeInsets.all(10),
        backgroundcolor: Colors.transparent,
        showBorder: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            danBrandCard(showBorder: false, brand: brand,),
            const SizedBox(height: danSizes.spacebtwInputFields,),

            Row(
                children: images.map((image) =>
                    brandTopProductImage(image, context)).toList()
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImage(image, context) {
    return Expanded(
      child: danCircularContainer(
          height: 111,
          margin: const EdgeInsets.only(right: 3),
          showBorder: false,
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const danShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
      ),
    );
  }
}

