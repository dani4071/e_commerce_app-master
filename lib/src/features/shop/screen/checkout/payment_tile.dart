import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/checkOut_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/payment_method_model.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

//// -----------------video 52-------bigginning---------

class danPaymentTile extends StatelessWidget {
  const danPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {

    final controller = CheckOutController.instance;
    final isDark = danHelperFunction.isDarkMode(context);


    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },

      leading: danCircularContainer(
        width: 60,
        height: 40,
        backgroundcolor: isDark ? Colors.black : Colors.transparent,
        padding: const EdgeInsets.all(danSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),

    );
  }
}
