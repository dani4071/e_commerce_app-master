import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';


class danBoxesShimmer extends StatelessWidget {
  const danBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: danShimmerEffect(width: 150, height: 110,)),
            SizedBox(width: danSizes.spacebtwItems,),
            Expanded(child: danShimmerEffect(width: 150, height: 110,)),
            SizedBox(width: danSizes.spacebtwItems,),
            Expanded(child: danShimmerEffect(width: 150, height: 110,)),
          ],
        )
      ],
    );
  }
}
