import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  /// fetch users with thier unique address after they create them
  Future<List<AddressModel>> fetchUserAddress() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw "Unable to find user information, try again in few minutes.";

      final result = await _db.collection("Users").doc(userId).collection("Addresses").get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();


    } catch (e){
      throw "Something went wrong address controller";
    }
  }




  /// Store new user order
 Future<String> addAddress(AddressModel address) async {
   try{
     final userId = AuthenticationRepository.instance.authUser!.uid;
     final currentAddress = await _db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
     return currentAddress.id;
   } catch (e) {
     throw "Something Went Wrong while saving address information, Try again later";
   }
 }


}