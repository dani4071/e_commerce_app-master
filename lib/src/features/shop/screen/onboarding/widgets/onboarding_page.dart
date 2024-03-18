import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';


class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image, title, subtitle;


  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(danSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              height: danHelperFunction.screenHeight() * 0.7,
              width: danHelperFunction.screenWidth() * 0.8,
              image: AssetImage(image)),
          Text(
            title,
            style: texttheme.headlineMedium,
          ),
          const SizedBox(
            height: danSizes.spacebtwItems,
          ),
          Text(
            subtitle,
            style: texttheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}