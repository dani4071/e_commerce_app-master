import 'package:e_commerce_app/src/common/widgets/images/dan_circular_image.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class danVerticalImageText extends StatelessWidget {
  const danVerticalImageText(
      {super.key,
      required this.image,
      this.textColor = danColors.white,
      required this.title,
      this.backgroundColor,
      this.isNetworkImage = true,
      this.onTap});

  final Color textColor;
  final String image, title;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: danSizes.spacebtwItems),
        child: Column(
          children: [
            danCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: danSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundcolor: backgroundColor,
              overlayColor: danHelperFunction.isDarkMode(context)
                  ? danColors.white
                  : danColors.dark,
            ),
            Text(title, style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}
