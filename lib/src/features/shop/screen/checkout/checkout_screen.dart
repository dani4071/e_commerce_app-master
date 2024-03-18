import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/widget/billing_address_section.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/widget/billing_section.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/widget/billing_payment_section.dart';
import '../cart/widget/cart_items.dart';
import '../cart/widget/coupon_code.dart';

class checkOutScreen extends StatelessWidget {
  const checkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = danHelperFunction.isDarkMode(context);
    final texttheme = Theme.of(context).textTheme;
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenWidth();
    // FIND OUT WHY ITS NOT SCROLLABLE

    return Scaffold(
      appBar: const danAppBar(title: Text("Check-Out"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.md),
          child: Column(
            children: [
              const cardItems(showaddbutton: false),
              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              const danCouponCode(),

              const SizedBox(
                height: danSizes.spacebtwsections,
              ),
              danCircularContainer(
                showBorder: true,
                backgroundcolor: isDark ? danColors.dark : danColors.white,
                child: const Padding(
                  padding: EdgeInsets.all(danSizes.md),
                  child: Column(
                    children: [

                      danBillingAmountSection(),

                      SizedBox(height: danSizes.spacebtwItems,),
                      Divider(),
                      SizedBox(height: danSizes.spacebtwItems,),

                      danBillingPaymentSection(),

                      SizedBox(height: danSizes.spacebtwsections,),

                      danBillingAddressSection()

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(danSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(successScreen(
          title: "Payment Successfull!",
          image: danImage.successImage,
          onPressed: () => Get.to(const navigationMenu()),
          subtitle: "Your item would be shipped",
        )), child: const Text("Chck-out")),
      ),
    );
  }
}


