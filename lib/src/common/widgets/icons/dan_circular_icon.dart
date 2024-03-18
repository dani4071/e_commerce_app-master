import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class danCircularIcon extends StatelessWidget {
  const danCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = danSizes.lg,
    this.iconn = Icons.favorite,
    this.color,
    this.backGroundColor,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final double? size;
  final IconData iconn;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backGroundColor != null
              ? backGroundColor!
              : danHelperFunction.isDarkMode(context)
                  ? Colors.transparent
                  : Colors.transparent,
      ),
      child: IconButton(
          icon: Icon(
            iconn,
            size: size,
            color: color,
          ),
          onPressed: onPressed),
    );
  }
}
