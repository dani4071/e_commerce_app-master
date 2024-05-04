import 'package:e_commerce_app/src/common/widgets/images/dan_rounded_images.dart';
import 'package:e_commerce_app/src/common/widgets/texts/brand_title_text_and_verified_icon.dart';
import 'package:e_commerce_app/src/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/src/features/shop/model/cart_item_model.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class danCardItem extends StatelessWidget {
  const danCardItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;

    return Row(
      children: [

        /// image
        danRoundedImages(
          imageUrl: cartItem.image ?? '',
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(danSizes.sm),
          backgroundColor: isDark ? danColors.darkerGrey : danColors.Light,
          isNetworkImage: true,
        ),


        const SizedBox(
          width: danSizes.defaultSpace,
        ),

        /// Title, Price & size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            danBrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
            danProductTitleText(title: cartItem.title ?? '', maxline: 1,),


            //// video 51, 40:30
            /// Attributes
            Text.rich( TextSpan(
              children: (cartItem.selectedVariation ?? {})
                  .entries
                  .map(
                    (e) => TextSpan(children: [
                      TextSpan(text: e.key, style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: e.value, style: Theme.of(context).textTheme.bodyLarge),
                    ]),
                  )
                  .toList(),
            )),
          ],
        )
      ],
    );
  }
}
