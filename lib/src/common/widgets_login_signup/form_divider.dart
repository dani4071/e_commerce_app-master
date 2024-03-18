import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class formDivider extends StatelessWidget {
  const formDivider({
    super.key,
    required this.isdark,
    required this.texttheme,
  });

  final bool isdark;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isdark? danColors.darkGrey : danColors.lightGrey, thickness: 1, indent: 60, endIndent: 5,)),
        Text(danTexts.orSignInWith.capitalize!, style: texttheme.bodyMedium,),
        Flexible(child: Divider(color: isdark? danColors.darkGrey : danColors.lightGrey, thickness: 1, indent: 5, endIndent: 60,)),
      ],
    );
  }
}