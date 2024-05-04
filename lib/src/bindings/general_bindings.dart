import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/checkOut_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/order_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/variation_controller.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckOutController());
  }

}