import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class danBillingPaymentSection extends StatelessWidget {
  const danBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return Column(
      children: [
        danSectionHeading(
            texttheme: texttheme,
            title: "Payment Method",
            title2: 'change',
            showbutton: true),

        const SizedBox(height: danSizes.spacebtwItems / 2,),

        Row(
          children: [
            const danCircularContainer(
              width: 60,
              height: 35,
              backgroundcolor: Colors.transparent,
              child: Image(image: AssetImage(danImage.facebook), fit: BoxFit.contain,),
            ),
            const SizedBox(width: danSizes.spacebtwItems / 2,),
            Text("Facebook", style: texttheme.bodyMedium,),
          ],
        )
      ],
    );
  }
}
