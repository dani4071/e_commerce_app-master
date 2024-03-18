import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/features/shop/model/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      //this docs makes it return the results one by one till theres nothing else. CHECk out -- video 41 (10:45) --
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    }on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on FormatException catch (_) {
      throw const danException().message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw "Something went wrong with Banners.";
    }
  }

}