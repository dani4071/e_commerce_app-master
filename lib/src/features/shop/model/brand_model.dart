

import 'package:cloud_firestore/cloud_firestore.dart';

class
BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;


  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
});



  // empty Helper function
  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  /// convert model to Json structure so that you can store data in firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }



// dont understand the diff between from snapshot and from json but check video 45, 13:15


// convert from json, a json would be passed
  /// Map Json oriented document snapshot from firebase to Usermodel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? '',
    );
  }

// it is going to recieve json as a type of document snapshot
  /// Map Json oriented document snapshot from firebase to Usermodel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      // Map json record to the model
      return BrandModel(
        id: data['Id'] ?? '',
        // id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? '',
      );
    } else {
      return BrandModel.empty();
    }

  }

}