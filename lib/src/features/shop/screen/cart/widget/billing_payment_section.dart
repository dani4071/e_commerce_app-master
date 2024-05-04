import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/checkOut_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class danBillingPaymentSection extends StatelessWidget {
  const danBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = CheckOutController.instance;

    return Column(
      children: [
        danSectionHeading(
          texttheme: texttheme,
          title: "Payment Method",
          title2: 'change',
          showbutton: true,
          onPressed: () => controller.selectPaymentMethod(context)),

        const SizedBox(height: danSizes.spacebtwItems / 2,),

        Obx(
          () => Row(
            children: [
              danCircularContainer(
                width: 60,
                height: 35,
                backgroundcolor: isDark ? danColors.black : danColors.white,
                child: Image(
                  image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain,),
              ),
              const SizedBox(width: danSizes.spacebtwItems / 2,),
              Text( controller.selectedPaymentMethod.value.name, style: texttheme.bodyLarge,),
            ],
          ),
        )
      ],
    );
  }
}
