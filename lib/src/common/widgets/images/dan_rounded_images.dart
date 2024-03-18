import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/shimmer_effect.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';

class danRoundedImages extends StatelessWidget {
  const danRoundedImages({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.applyImageRadius = true,
    this.onPressed,
    this.border,
    this.fit = BoxFit.fill,
    this.backgroundColor = danColors.white,
    this.padding,
    this.isNetworkImage = false,
    this.borderRadius = danSizes.md,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final bool applyImageRadius;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final BoxFit? fit;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  //width ?? double.infinity
            //height ?? 158
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const danShimmerEffect(
                          width: double.infinity,
                          height: 0),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImage
                      ? NetworkImage(imageUrl)
                      : AssetImage(imageUrl) as ImageProvider)
        ),
      ),
    );
  }
}
