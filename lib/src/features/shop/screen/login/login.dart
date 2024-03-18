import 'package:e_commerce_app/src/common/styles/spacing_style.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/widgets/login_form.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/widgets/login_header.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets_login_signup/form_divider.dart';
import '../../../../common/widgets_login_signup/social_buttons.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isdark = danHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: danSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              loginHeader(texttheme: texttheme),
              const SizedBox(height: danSizes.spacebtwItems,),
              const loginForm(),
              formDivider(isdark: isdark, texttheme: texttheme),
              const SizedBox(height: danSizes.spacebtwItems,),
              const danSocialsButton()
            ],
          ),
        ),
      ),
    );
  }
}










