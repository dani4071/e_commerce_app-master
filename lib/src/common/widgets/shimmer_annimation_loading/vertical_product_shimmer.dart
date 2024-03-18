import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class danVerticalProductShimmer extends StatelessWidget {
  const danVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return danGridLayout(
      itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///image
                  danShimmerEffect(width: 180, height: 180),
                  SizedBox(
                    height: danSizes.spacebtwItems,
                  ),

                  // /// text
                  // danShimmerEffect(width: 160, height: 15),
                  // SizedBox(
                  //   height: danSizes.spacebtwItems / 2,
                  // ),
                  // danShimmerEffect(width: 110, height: 15),
                ],
              ),
            ),
    );
  }
}
