import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class ratingAndShare extends StatelessWidget {
  const ratingAndShare({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            SizedBox(
              width: danSizes.spacebtwItems / 2,
            ),
            // Text("5.0"),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "5.0 "),
                  TextSpan(text: "(199)"),
                ]
              )
            )
          ],
        ),
        Icon(
          Icons.share,
          color: isDark ? danColors.white : danColors.dark,
        )
      ],
    );
  }
}