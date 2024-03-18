import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:flutter/material.dart';

class danBrandTitleText extends StatelessWidget {
  const danBrandTitleText({
    super.key,
    required this.title,
    this.maxline = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
    this.color,
  });

  final String title;
  final int maxline;
  final TextAlign textAlign;
  final TextSizes brandTextSizes;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxline,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: brandTextSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSizes == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSizes == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
