import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';


class danRatingBarIndicator extends StatelessWidget {
  const danRatingBarIndicator({
    super.key, required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: value,
        itemSize: 20,
        unratedColor: danColors.softGrey,
        itemBuilder: (_, __) => const Icon(Iconsax.star1, color: danColors.primary,));
  }
}