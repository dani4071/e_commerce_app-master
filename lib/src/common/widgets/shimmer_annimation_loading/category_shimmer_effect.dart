import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class danCategoryShimmer extends StatelessWidget {
  const danCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                danShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: danSizes.spacebtwItems / 2,
                ),
                //text
                danShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: danSizes.spacebtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
