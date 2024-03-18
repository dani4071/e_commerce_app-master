import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../shimmer_annimation_loading/shimmer_effect.dart';

class danCircularImage extends StatelessWidget {
  const danCircularImage({
    super.key,
    this.padding = danSizes.sm,
    this.backgroundcolor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.width = 56,
    this.height = 56,
  });

  final double padding;
  final Color? backgroundcolor;
  final Color? overlayColor;
  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      // padding: padding,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundcolor ?? (isDark ? danColors.dark : danColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
         // cachedNetworkImage downloads the image and lets us use it again and agian whenever we login/ it'd just be there
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, downloadProgress) => const danShimmerEffect(width: 55, height: 55),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                image: AssetImage(image),
                fit: fit,
                color: overlayColor,
              ),
      ),
    );
  }
}
