import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

import '../layouts/grid_layout.dart';

class danHorizontalProductShimmer extends StatelessWidget {
  const danHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: danSizes.spacebtwsections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: danSizes.spacebtwItems,
        ),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            danShimmerEffect(width: 120, height: 120),
            SizedBox(
              width: danSizes.spacebtwItems,
            ),

            // text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: danSizes.spacebtwItems / 2,
                ),
                danShimmerEffect(width: 160, height: 15),
                SizedBox(
                  height: danSizes.spacebtwItems / 2,
                ),
                danShimmerEffect(width: 110, height: 15),
                SizedBox(
                  height: danSizes.spacebtwItems / 2,
                ),
                danShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
