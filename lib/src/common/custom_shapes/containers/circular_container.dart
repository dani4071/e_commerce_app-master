import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';


class danCircularContainer extends StatelessWidget {
  const danCircularContainer(
      {super.key,
        this.width,
        this.height,
        this.radius = danSizes.cardRadiusLg,
        this.padding,
        this.margin,
        this.child,
        this.backgroundcolor = danColors.white,
        this.showBorder = false,
        this.borderColor = danColors.borderPrimary
      });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundcolor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor): null,
      ),
      child: child,
    );
  }
}