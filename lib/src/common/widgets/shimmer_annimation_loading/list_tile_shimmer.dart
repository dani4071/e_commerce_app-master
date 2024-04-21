import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';


class danListTileShimmer extends StatelessWidget {
  const danListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        danShimmerEffect(width: 50, height: 50, radius: 50,),
        SizedBox(width: danSizes.spacebtwItems,),
        Column(
          children: [
            danShimmerEffect(width: 100, height: 15),
            SizedBox(height: danSizes.spacebtwItems / 2,),
            danShimmerEffect(width: 80, height: 12),
          ],
        )
      ],
    );
  }
}
