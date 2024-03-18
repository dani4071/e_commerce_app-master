import 'package:e_commerce_app/src/common/styles/spacing_style.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class successScreen extends StatelessWidget {
  const successScreen({super.key, required this.title, required this.subtitle, required this.image, required this.onPressed});

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: danSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: danHelperFunction.screenWidth() * 0.9,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              Text(title,
                style: texttheme.headlineMedium,
              ),
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              Text(subtitle,
                style: texttheme.labelMedium,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed, child: const Text("Continue Shopping"))),
            ],
          ),
        ),
      ),
    );
  }
}
