import 'package:e_commerce_app/src/utils/theme/custom_theme/appbar_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/bottom_sheet_text.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/chip_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/text_field_theme.dart';
import 'package:e_commerce_app/src/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';


class danAppTheme {
  danAppTheme._();


  static ThemeData danlightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: danTexttheme.lightTexttheme,
    elevatedButtonTheme: danElevatedbtnTheme.lightelevatedbtn,
    appBarTheme: danAppbar.lightAppBarTheme,
    bottomSheetTheme: danBottomsheet.lightBtnsheet,
    checkboxTheme: danCheckboxTheme.lightCheckboxtheme,
    chipTheme:danChipTheme.lightChiptheme,
    outlinedButtonTheme: danOutlinedbtnTheme.lightOutlinedThemedata,
    inputDecorationTheme: danTextFormfield.lightInputDecTheme,
  );

  static ThemeData dandarkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: danTexttheme.darktexttheme,
    elevatedButtonTheme: danElevatedbtnTheme.darkelevatedbtn,
    appBarTheme: danAppbar.darkAppBarTheme,
    bottomSheetTheme: danBottomsheet.darkBtnsheet,
    checkboxTheme: danCheckboxTheme.darkCheckboxtheme,
    chipTheme:danChipTheme.darkChiptheme,
    outlinedButtonTheme: danOutlinedbtnTheme.darkOutlinedThemedata,
    inputDecorationTheme: danTextFormfield.darkInputDecTheme,
  );

}