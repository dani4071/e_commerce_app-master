import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';



class danGridLayout extends StatelessWidget {
  const danGridLayout({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisExtent = 0.43,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    final screenHeight = danHelperFunction.screenHeight();

    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        padding: const EdgeInsets.all(21),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisExtent: screenHeight * mainAxisExtent!,
          mainAxisExtent: screenHeight / 2.7,
          mainAxisSpacing: danSizes.gridViewSpacing,
          crossAxisSpacing: danSizes.gridViewSpacing,
        ),
        itemBuilder: itemBuilder,
    );
  }
}

