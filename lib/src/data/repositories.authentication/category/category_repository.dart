import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/data/services/firebase_storage_services/firebase_storage_services.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/exceptions.dart';


class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;


  /// Get all categories
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final snapShot = await _db.collection("Categories").get();
      final list = snapShot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    }catch (e) {
      throw "Something went wrong. please try again catch 4";
    }
  }


  /// Get Sub categories




  /// Upload categories to the cloud store
  Future<void> uploadDummyData(List<CategoryModel> categories) async {

    try{
      // Upload all the categorires along with their images
      final storage = Get.put(danFirebaseStorage());
      
      // loop through each category
      for(var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);
        
        // upload image and get its url
        final url = await storage.uploadImageData("Categories", file, category.name);
        
        // Assign URL to Category.image attribute
        category.image = url;
        
        // Store Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }

    } on FirebaseException catch (e) {
      throw danException(e.code).message;
    } on PlatformException catch (e) {
      throw danException(e.code).message;
    }
    catch (e) {
      throw "Something went wrong. please try again 4";
    }

  }


}