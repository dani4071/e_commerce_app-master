import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class orderList extends StatelessWidget {
  const orderList({super.key});

  @override
  Widget build(BuildContext context) {


    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return ListView.separated(
        separatorBuilder: (_, index) => const SizedBox(height: danSizes.spacebtwItems,),
    itemCount: 4,
    shrinkWrap: true,
    itemBuilder: (_, __) => danCircularContainer(
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
              const SizedBox(width: danSizes.spacebtwItems / 2,),


              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Processing", style: texttheme.bodyLarge!.apply(color: danColors.primary, fontWeightDelta: 1)),
                    Text("22 Nov 2121", style: texttheme.headlineSmall),
                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_sharp, size: danSizes.iconsm,)),
            ],
          ),


          const SizedBox(height: danSizes.spacebtwItems,),


          Row(
            children: [
              const Row(
                children: [
                  Icon(Iconsax.pen_add),
                  SizedBox(width: danSizes.spacebtwItems / 2,),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order", style: texttheme.bodyLarge!.apply(color: danColors.primary, fontWeightDelta: 1)),
                    Text("[#2334]", style: texttheme.headlineSmall),
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(Iconsax.tag),
                  SizedBox(width: danSizes.spacebtwItems / 2,),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shipping Date", style: texttheme.bodyLarge!.apply(color: danColors.primary, fontWeightDelta: 1)),
                    Text("6 Oct 2121", style: texttheme.headlineSmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: danSizes.spacebtwItems,),
        ],
      ),
    ));
  }
}
