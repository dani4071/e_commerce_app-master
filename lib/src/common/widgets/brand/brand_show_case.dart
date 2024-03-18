import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

import '../../custom_shapes/containers/circular_container.dart';
import 'brand_card.dart';


class danBrandShowCase extends StatelessWidget {
  const danBrandShowCase({
    super.key,
    required this.texttheme,
    required this.images,
  });

  final TextTheme texttheme;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return danCircularContainer(
      padding: const EdgeInsets.all(10),
      backgroundcolor: Colors.transparent,
      showBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const danBrandCard(showBorder: false),
          const SizedBox(height: danSizes.spacebtwInputFields,),

          Row(
              children: images.map((image) => brandTopProductImage(image, context)).toList()
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImage(image, context) {
    return const Expanded(
      child: danCircularContainer(
        height: 111,
        margin: EdgeInsets.only(right: 3),
        showBorder: false,
        child:
        Image(image: AssetImage(danImage.onboardingImage4)),
      ),
    );
  }
}

