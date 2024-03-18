import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/screen/brand/brand_product.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';

class allBrandScreen extends StatelessWidget {
  const allBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: danAppBar(
          showBackArrow: true,
          title: Text(
            "Brands",
            style: texttheme.bodyLarge,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.sm),
          child: Column(children: [
            danSectionHeading(texttheme: texttheme, title: "brands"),
            const SizedBox(
              height: danSizes.spacebtwItems,
            ),
            danGridLayout(
              itemBuilder: (context, index) => danBrandCard(showBorder: true, onPressed: () => Get.to(const brandProduct()),),
              mainAxisExtent: 0.10,
              itemCount: 11,
            )
          ]),
        ),
      ),
    );
  }
}
