import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/shop/screen/order/widgets/order_list.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return Scaffold(

      /// --- Appbar
      appBar: danAppBar(title: Text("My Orders", style: texttheme.bodyMedium,), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(22),


        /// -- orders
        child: orderList(),
      ),
    );
  }
}

//child: Column(
//             children: [
//               danCircularContainer(
//                 // height: 55,
//                 width: double.infinity,
//                 backgroundcolor: isDark ? danColors.dark : danColors.white,
//                 showBorder: true,
//                 padding: const EdgeInsets.all(danSizes.md),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.shopping_bag),
//                             const SizedBox(width: danSizes.spacebtwItems / 2,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("data", style: texttheme.bodyMedium,),
//                                 Text("02 Nov 2021",  style: texttheme.bodyLarge,),
//                               ],
//                             )
//                           ],
//                         ),
//                         IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_sharp)),
//                       ],
//                     ),
//                     const SizedBox(height: danSizes.spacebtwItems,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.shopping_bag),
//                             const SizedBox(width: danSizes.spacebtwItems / 2,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Order", style: texttheme.bodyMedium,),
//                                 Text("[#0243]",  style: texttheme.bodyLarge,),
//                               ],
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             const Icon(Icons.shopping_bag),
//                             const SizedBox(width: danSizes.spacebtwItems / 2,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Shopping date", style: texttheme.bodyMedium,),
//                                 Text("02 Nov 2021",  style: texttheme.bodyLarge,),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

