import 'package:e_commerce_app/src/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../../common/widgets/products/carts/cart_item.dart';

class cardItems extends StatelessWidget {
  const cardItems({
    super.key,
    this.showaddbutton = true,
  });

  final bool showaddbutton;

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final cartController = CartController.instance;

    return Obx(
      () =>  ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: danSizes.defaultSpace,
        ),
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                danCardItem(cartItem: item,),


                if(showaddbutton) const SizedBox(
                  height: 0,
                  //height: danSizes.spacebtwItems,
                ),

                /// Add and Remove button Row with total price
                if(showaddbutton) Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // extra space
                        const SizedBox(width: 70),

                        /// Add Remove buttons
                        danProductQualityWithAddRemove(
                          quantity: item.quantity,
                          add: () => cartController.addOneItemToCart(item),
                          minus: () => cartController.removeOneFromCart(item),),

                      ],
                    ),
                    /// Product total price
                    //// this toStringAsFixed makes it return only a place of a decimal place
                    danProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))

                  ],
                ),


              ],
            );
          }

        ),
      ),
    );
  }
}
