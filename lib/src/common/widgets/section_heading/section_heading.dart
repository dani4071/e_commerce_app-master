import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class danSectionHeading extends StatelessWidget {
  const danSectionHeading({
    super.key,
    required this.texttheme,
    required this.title,
    this.title2 = "view all",
    this.onPressed,
    this.showbutton = false,
    this.padding = const EdgeInsets.symmetric(horizontal: danSizes.md),
  });

  final TextTheme texttheme;
  final String title;
  final String title2;
  final VoidCallback? onPressed;
  final bool showbutton;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
        title,
        style: texttheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
      ),

      if (showbutton) TextButton(
          onPressed: onPressed,
          child: Text(title2,
            style: texttheme.titleSmall!.apply(color: Colors.grey),
              )),
      ],
    ),);
  }
}
