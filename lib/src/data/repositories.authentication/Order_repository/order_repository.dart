import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:get/get.dart';

import '../../../features/shop/model/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();


  /// variables
  final _db = FirebaseFirestore.instance;


  /// Get all order related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser.uid;
      if(userId.isEmpty) throw 'Unable to find user information. try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching order information order Repo, Try again later';
    }
  }



  /// Store new User order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong saving Order Informate. Try again later';
    }


  }



}