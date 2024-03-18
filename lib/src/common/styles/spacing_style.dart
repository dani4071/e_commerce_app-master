import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';


class danSpacingStyle {

  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: danSizes.appBarHeight,
    left: danSizes.defaultSpace,
    right: danSizes.defaultSpace,
    bottom: danSizes.defaultSpace,
  );
}