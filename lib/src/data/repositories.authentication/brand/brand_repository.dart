import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/features/shop/model/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/exceptions.dart';



class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<List<BrandModel>> getAllBrands() async {

    try {

      final snapshot = await _db.collection("Brands").get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on FormatException catch (_) {
      throw const danException().message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }catch (e) {

      throw "Soomething ga wrong while fetching brands";
    }
  }



  /// Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get al documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds  = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Query to get all document where the brandId is in the list of brandIds, fieldPath.documentId to query documents in collection
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on FormatException catch (_) {
      throw const danException().message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }catch (e) {

      throw "Soomething ga wrong while fetching brands";
    }
  }
}