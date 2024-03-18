import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/model/product_model.dart';
import '../../../utils/exceptions/exceptions.dart';


class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('isFeatured', isEqualTo: true).limit(4).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapShot(document)).toList();
      return list;
      // return snapshot.docs.map((documentSnapshot) => ProductModel.fromSnapShot(documentSnapshot)).toList();


      //     final snapShot = await _db.collection("Categories").get();
      //  final list = snapShot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      //       return list;


      //
      //final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      //this docs makes it return the results one by one till theres nothing else. CHECk out -- video 41 (10:45) --
     // return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();


    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }



// video 42 at 21:04
/// Upload dummy data to the cloud firestore



}