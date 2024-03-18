import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class subCategoryScreen extends StatelessWidget {
  const subCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: danAppBar(
          showBackArrow: true,
          title: Text(
            "Sports",
            style: texttheme.bodyLarge,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.sm),
          child: Column(
            children: [
              const danRoundedImages(
                imageUrl: danImage.onboardingImage6,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              Column(
                children: [
                  danSectionHeading(
                      texttheme: texttheme,
                      title: "Sports Equipment",
                      showbutton: true),
                  const SizedBox(
                    height: danSizes.spacebtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const danProductCardHorizontal(),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: danSizes.spacebtwItems,
                            ),
                        itemCount: 4),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
