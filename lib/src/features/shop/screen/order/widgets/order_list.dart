import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/order_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class orderList extends StatelessWidget {
  const orderList({super.key});

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final orderController = Get.put(OrderController());

    return FutureBuilder(
        future: orderController.fetchUserOrders(),
        builder: (_, snapshot) {
          /// nothing found widegt
          final emptyWidget = danAnimationLoaderWidget(
            text: "Whoops! no oreder yet! order list screen",
            animation: danImage.pencilAnimation,
            showAction: true,
            actionText: "Let's fill it",
            onActionPresed: () => Get.off(() => const navigationMenu()),
          );

          /// Helper function: handle loader, no record, or error message
          final response = danCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// congratulation record found
          final orders = snapshot.data!;

          return ListView.separated(
              separatorBuilder: (_, index) =>
              const SizedBox(
                height: danSizes.spacebtwItems,
              ),
              itemCount: orders.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {

                final order = orders[index];

                return danCircularContainer(
                  showBorder: true,
                  backgroundcolor: isDark ? danColors.dark : danColors.white,
                  padding: const EdgeInsets.all(danSizes.md),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Iconsax.ship),
                          const SizedBox(
                            width: danSizes.spacebtwItems / 2,
                          ),

                          /// status and date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.orderStatusText,
                                    style: texttheme.bodyLarge!.apply(
                                        color: danColors.primary,
                                        fontWeightDelta: 1)),
                                Text(order.formattedOrderDate,
                                    style: texttheme.headlineSmall),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: danSizes.iconsm,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: danSizes.spacebtwItems,
                      ),


                      /// -- bottom row
                      Row(
                        children: [

                          /// Order No
                          const Row(
                            children: [
                              Icon(Iconsax.pen_add),
                              SizedBox(
                                width: danSizes.spacebtwItems / 2,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order",
                                    style: texttheme.bodyLarge!.apply(
                                        color: danColors.primary,
                                        fontWeightDelta: 1)),
                                Text(order.id,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: texttheme.headlineSmall),
                              ],
                            ),
                          ),

                          /// delivery date
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Iconsax.calendar),
                                const SizedBox(width: danSizes.spacebtwItems / 2,),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Shipping Date",
                                          style: texttheme.bodyLarge!.apply(
                                              color: danColors.primary,
                                              fontWeightDelta: 1)),
                                      Text(order.formattedDeliveryDat,
                                          style: texttheme.headlineSmall),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(
                        height: danSizes.spacebtwItems,
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
