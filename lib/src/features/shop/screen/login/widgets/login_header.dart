import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';



class loginHeader extends StatelessWidget {
  const loginHeader({
    super.key,
    required this.texttheme,
  });

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          image: AssetImage(danImage.lighttAppLogo),
        ),
        Text(
          danTexts.loginTitle,
          style: texttheme.headlineMedium,
        ),
        // SizedBox(height: danSizes.sm,),
        Text(danTexts.loginSubTitle, style: texttheme.bodySmall,),
      ],
    );
  }
}