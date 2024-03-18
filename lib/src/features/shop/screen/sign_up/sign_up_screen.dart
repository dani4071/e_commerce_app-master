import 'package:e_commerce_app/src/features/shop/screen/sign_up/widgets/signup_form.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);


    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(danSizes.defaultSpace),
          child: danSignUpForm(),
        ),
      ),
    );
  }
}
