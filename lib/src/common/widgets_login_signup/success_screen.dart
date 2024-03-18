import 'package:e_commerce_app/src/common/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';


class successScreen extends StatelessWidget {
  const successScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onpress});


  final String image, title, subtitle;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {

    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    const spacebtwitems = SizedBox(height: danSizes.spacebtwItems);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: danSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: danHelperFunction.screenWidth() * 0.6,
              ),

              Text(
                title,
                style: texttheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              spacebtwitems,

              Text(
                subtitle,
                style: texttheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: danSizes.spacebtwsections,
              ),

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onpress, child: const Text(danTexts.continuee))),
            ],
          ),
        ),
      ),
    );
  }
}
