import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/common/widgets_login_signup/success_screen.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/Order_repository/order_repository.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/cart_controller.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/checkOut_controller.dart';
import 'package:e_commerce_app/src/features/shop/model/order_model.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../navigation_menu.dart';


class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkOutController = CheckOutController.instance;
  final orderRepository = Get.put(OrderRepository());


  /// Fetch Users order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      danLoaders.warningSnackBar(
          title: "oh Snap! order controller", message: e.toString());
      return [];
    }
  }


  /// Add methods for order processing
//// this is the one that will save the order details

  void processOrder(double totalAmount) async {
    try {
      // start loader
      danFullScreenLoader.customLoading();

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;


      // Add details
      final order = OrderModel(
        // Generate a unique ID for the order
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkOutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // set date as needed
        deliveryyDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );


      // Save the Order to firebase
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.clearCart();


      // show success screen
      Get.off(() => successScreen(
        title: "Payment Successfull",
        image: danImage.successImage,
        onpress: () => Get.offAll(() => const navigationMenu()),
        subtitle: "Your item would be shipped soon!",
      ));
      // update the cart status
    } catch (e) {
      danLoaders.errorSnackBar(title: "oh snap! order controller", message: e.toString());
    }
  }


}