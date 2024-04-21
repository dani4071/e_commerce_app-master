import 'package:e_commerce_app/src/utils/device/device_utility.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class danTabbar extends StatelessWidget implements PreferredSizeWidget {
  const danTabbar({super.key, required this.tabs});


  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    return Material(
      color: isDark ? Colors.yellow : Colors.blue,
      child: TabBar(
        isScrollable: true,
        //indicatorColor: danColors.primary,
        indicatorColor:  Colors.red,
        //unselectedLabelColor: danColors.lightGrey,
        unselectedLabelColor:  Colors.red,
        labelColor: isDark ? Colors.red : Colors.red,
        tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(danDeviceUtils.appBarHeight());
}
