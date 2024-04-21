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
      final snapshot = await _db.collection('Products').where(
          'isFeatured', isEqualTo: true).limit(4).get();
      final list = snapshot.docs.map((document) =>
          ProductModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }

  /// get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where(
          'isFeatured', isEqualTo: true).get();
      final list = snapshot.docs.map((document) =>
          ProductModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }

  /// Get products based on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) =>
          ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }

  /// Get products based on the brand
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((snapshot) => ProductModel.fromSnapShot(snapshot)).toList();
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }


  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querysnapshot = limit == -1
          ? await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).get()
          : await _db.collection("Products").where("Brand.Id", isEqualTo: brandId).limit(limit).get();

      final products = querysnapshot.docs.map((doc) => ProductModel.fromSnapShot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw 'Something Weeent Wrong. $e';
    }
  }


  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      // Query to get all documents where productId matches the provided categoryId and Fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).get()
          : await _db.collection("ProductCategory").where("categoryId", isEqualTo: categoryId).limit(limit).get();

      // Extract products from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // Query to get all documents where the brandId/categoryId is in the list of brandIds/categoryId, fieldPath.documentId to get query documents in collection
      /// this document id field path is being compared to the product id it received -- video 47 --10:10
      final productsQuery = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();

      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapShot(doc)).toList();

      return products;
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