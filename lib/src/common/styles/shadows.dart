import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';



class danShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: danColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


  static final horizontalProductShadow = BoxShadow(
    color: danColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}