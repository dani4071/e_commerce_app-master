import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/device/device_utility.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class danAppBar extends StatelessWidget implements PreferredSizeWidget {
  const danAppBar({super.key,
    this.leadingIcon,
    this.title,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.centertile = false,
  });


  final IconData? leadingIcon;
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;
  final bool centertile;


  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: danSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: isDark ? danColors.white : danColors.black,))
            : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,

        title: title,
        actions: actions,
        centerTitle: centertile,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(danDeviceUtils.appBarHeight());
}
