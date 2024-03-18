import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class danFirebaseStorage extends GetxController {

  static danFirebaseStorage get instance => Get.find();


  final _firebaseStrorage = FirebaseStorage.instance;

  /// Upload local asset from IDE
  ///  returen a uint8List containing image data

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw "Error loading image data: $e";
    }
  }

  /// Upload Image using ImageData on cloud firebase storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStrorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // handle exceptions gracefully
      if(e is FirebaseException) {
        throw "FireBase Exception: ${e.message}";
      } else if (e is SocketException) {
        throw "FireBase Exception: ${e.message}";
      } else if (e is PlatformException) {
        throw "FireBase Exception: ${e.message}";
      } else {
        throw "Something went wrong! please try again";
      }
    }
  }


  /// Upload image on cloud firebase Storage
 /// Returns the downloaded url of the uploaded image
 Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStrorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if(e is FirebaseException) {
        throw "FireBase Exception: ${e.message}";
      } else if (e is SocketException) {
        throw "FireBase Exception: ${e.message}";
      } else if (e is PlatformException) {
        throw "FireBase Exception: ${e.message}";
      } else {
        throw "Something went wrong! please try again";
      }
    }

 }

}