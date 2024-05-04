import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:e_commerce_app/src/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class danBillingAmountSection extends StatelessWidget {
  const danBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: texttheme.bodyMedium,),
            Text("\$$subTotal", style: texttheme.bodyMedium,),
          ],
        ),

        const SizedBox(height: danSizes.spacebtwItems / 2,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping fee", style: texttheme.bodyMedium,),
            Text("\$${danPricingCalculator.calculateShippingCost(subTotal, 'US')}", style: texttheme.bodyMedium,),
          ],
        ),

        const SizedBox(height: danSizes.spacebtwItems / 2,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: texttheme.bodyMedium,),
            Text("\$${danPricingCalculator.calculateTax(subTotal, 'US')}", style: texttheme.bodyMedium,),
          ],
        ),

        const SizedBox(height: danSizes.spacebtwItems,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: texttheme.bodyMedium,),
            Text("\$${danPricingCalculator.calculateTotalPrice(subTotal, 'US')}", style: texttheme.titleLarge,),
          ],
        ),
      ],
    );
  }
}
