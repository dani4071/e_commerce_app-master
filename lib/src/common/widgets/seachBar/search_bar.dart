import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class danSearchBar extends StatelessWidget {
  const danSearchBar({
    super.key,
    required this.screenHeight,
    this.padding = const EdgeInsets.all(danSizes.md),
  });

  final double screenHeight;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: screenHeight * 0.08,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(danSizes.fontsizesm),
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Iconsax.search_favorite),
              hintText: "Search in our Stores"),
        ),
      ),
    );
  }
}