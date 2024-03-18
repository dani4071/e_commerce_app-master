import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';

class danCounterIcon extends StatelessWidget {
  const danCounterIcon({
    super.key,
    required this.texttheme,
    required this.iconColor,
    required this.onpressed,
    this.istrue = false,
  });

  final TextTheme texttheme;
  final Color iconColor;
  final VoidCallback onpressed;
  final bool istrue;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: onpressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                color: isDark ? danColors.white : danColors.dark,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Text(
              '2',
              style: texttheme.labelLarge!
                  .apply(color: isDark ? danColors.dark : danColors.white, fontSizeFactor: 0.8),
            )),
          ),
        )
      ],
    );
  }
}
