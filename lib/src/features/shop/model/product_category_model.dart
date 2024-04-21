import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String categoryid;
  final String productid;

  ProductCategoryModel({required this.categoryid, required this.productid});


  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryid,
      'productId': productid,
    };
  }


  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
        categoryid: data['categoryId'] as String,
        productid: data['productId'] as String,
    );
  }
}
