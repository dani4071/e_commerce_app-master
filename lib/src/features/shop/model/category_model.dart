import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.parentId,
  });

  static CategoryModel empty() => CategoryModel(
      id: "", image: "", name: "", isFeatured: false, parentId: "");

  /// convert model to json struture so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Image": image,
      "ParentID": parentId,
      "isFeatured": isFeatured,
    };
  }

  /// Map Json oriented document snapshot from firebase to model
  factory CategoryModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      //Map JSON record to the model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['isFeatured'] ?? false,
          parentId: data['ParentID'] ?? '');
    } else {
      return CategoryModel.empty();
    }
  }
}
