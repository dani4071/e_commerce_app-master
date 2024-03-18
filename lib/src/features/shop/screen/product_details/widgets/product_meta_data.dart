import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_circular_image.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/product_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/brand_title_text_and_verified_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../model/product_model.dart';

class productMetaData extends StatelessWidget {
  const productMetaData({
    super.key, required this.product,
  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {

    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenWidth();
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            danCircularContainer(
              height: 25,
              width: 35,
              radius: 5,
              backgroundcolor: Colors.yellow,
              child: Center(child: Text("$salePercentage%", style: texttheme.bodyMedium!.apply(color: danColors.dark),)),
            ),
            const SizedBox(
              width: danSizes.spacebtwItems,
            ),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
            Text("${product.price}", style: texttheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0 )SizedBox(
              width: danSizes.spacebtwItems,
            ),

            danProductPriceText(price: controller.getProductPrice(product), isLarge: true),
           ],
        ),

        const SizedBox(
          height: danSizes.spacebtwItems,
        ),
        Text(product.title, style: texttheme.bodyMedium,),
        const SizedBox(
          height: danSizes.spacebtwItems,
        ),
        Row(
          children: [
            Text("Status: ", style: texttheme.bodyMedium,),
            const SizedBox(
              height: danSizes.spacebtwItems,
            ),
            Text(controller.getProductStockStatus(product.stock), style: texttheme.bodyMedium,),
          ],
        ),
        const SizedBox(
          height: danSizes.spacebtwItems,
        ),

        // brand
        Row(
          children: [

            danCircularImage(image: product.brand != null ? product.brand!.image : "", isNetworkImage: true, height: 35, width: 35,),

            danBrandTitleTextWithVerifiedIcon(title: product.brand != null ? product.brand!.name : "yooddd", brandTextSizes: TextSizes.medium,),
          ],
        ),

      ],
    );
  }
}