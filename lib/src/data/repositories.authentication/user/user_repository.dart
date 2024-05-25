import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/data/models/user_model.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/exceptions.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// function to save user data to firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException {
      throw "Something went wrong. please try again 1:1";
    } on FormatException catch (_) {
      throw "Something went wrong. please try again 2:2";
    } on PlatformException {
      throw "Something went wrong. please try again 3:3";
    } catch (e) {
      throw "Something went wrong. please try again 4:4";
    }
  }


  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapShot = await _db.collection("Users").doc(
          AuthenticationRepository.instance.authUser.uid).get();
      // what the above function returns is called a snapshot
      if (documentSnapShot.exists) {
        return UserModel.fromSnapShot(documentSnapShot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException {
      throw "Something went wrong. please try again 1:2";
    } on FormatException catch (_) {
      throw "Something went wrong. please try again 2:3";
    } on PlatformException {
      throw "Something went wrong. please try again 3:4";
    } catch (e) {
      throw "Something went wrong. please try again 4:5";
    }
  }


  /// Function to update user data in the firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException {
      throw "Something went wrong. please try again 1:1:1";
    } on FormatException catch (_) {
      throw "Something went wrong. please try again 2:2:2";
    } on PlatformException {
      throw "Something went wrong. please try again 3:3:3";
    } catch (e) {
      throw "Something went wrong. please try again 4:4:4";
    }
  }
  
  
  /// update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser.uid).update(json);
    } on FirebaseException {
      throw "Something went wrong. please try again 1:1:1";
    } on FormatException catch (_) {
      throw "Something went wrong. please try again 2:2:2";
    } on PlatformException {
      throw "Something went wrong. please try again 3:3:3";
    } catch (e) {
      throw "Something went wrong. please try again 4:4:4";
    }
  }


  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    }  on FirebaseException {
      throw "Something went wrong. please try again 1:1:1";
    } on FormatException catch (_) {
      throw "Something went wrong. please try again 2:2:2";
    } on PlatformException {
      throw "Something went wrong. please try again 3:3:3";
    } catch (e) {
      throw "Something went wrong. please try again 4:4:4";
    }
  }



  /// Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      // the below converts the image into a file then stores the file in the putfile part for the ref
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      throw const danException().message;
      // throw "Something went wrong. please try again 3";
    } on PlatformException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrongg. please try again 5";
    }
  }
}