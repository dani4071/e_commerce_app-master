import 'package:e_commerce_app/src/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:flutter/material.dart';

class danBrandShimmer extends StatelessWidget {
  const danBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return danGridLayout(
        itemBuilder: (_, __) => const danShimmerEffect(width: 300, height: 80),
        itemCount: itemCount);
  }
}
