import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/shop/screen/checkout/payment_tile.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/payment_method_model.dart';


class CheckOutController extends GetxController{
  static CheckOutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  //// onInit method was used here to low key assign default
  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: danImage.payPalLogo, name: "PayPal");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(danSizes.lg),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            danSectionHeading(texttheme: Theme.of(context).textTheme, title: "Select Payment Method", showbutton: false,),
            const SizedBox(height: danSizes.spacebtwsections,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.payPalLogo, name: "PayPall")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.googlePayLogo, name: "Google Pay")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.applePayLogo, name: "Apple Pay")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.visaLogo, name: "Visa")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.masterCardLogo, name: "Master Card")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
            danPaymentTile(paymentMethod: PaymentMethodModel(image: danImage.payStackLogo, name: "PayStack")),
            const SizedBox(height: danSizes.spacebtwItems / 2,),
          ],
        ),
      ),
    ));



  }


}