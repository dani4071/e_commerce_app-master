import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class danBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const danBrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxline = 1,
    this.textcolor,
    this.iconcolor,
    this.brandTextSizes = TextSizes.small,
    this.textalign = TextAlign.center,
  });

  final String title;
  final int maxline;
  final Color? textcolor;
  final Color? iconcolor;
  final TextSizes brandTextSizes;
  final TextAlign textalign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: danBrandTitleText(
          title: title,
            color: textcolor,
            maxline: maxline,
            textAlign: textalign,
            brandTextSizes: brandTextSizes,
        )),
        const SizedBox(
          width: danSizes.xs / 2,
        ),
        const Icon(
          Iconsax.verify5,
          color: danColors.primary,
          size: danSizes.iconxs,
        )
      ],
    );
  }
}
