import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/features/shop/model/product_attribute_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_variation_model.dart';

import 'brand_model.dart';

class ProductModel {

  String id;
  int stock;
  String? sku;
  String title;
  DateTime? date;
  double price;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;


  ProductModel ({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
});


  static ProductModel empty () => ProductModel(id: "", title: "", stock: 0, price: 0, thumbnail: "", productType: "");
  
  
  toJson() {
    return{
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'isFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toString() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toString() : [],
    };
  }



  /// Map Json oriented document snapshot from firebase to model
  factory ProductModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      title: data['Title'],
      sku: data['SKU'],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      description: data['Description'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['isFeatured'] ?? false,
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'],
      productType: data['ProductType'],
    );
  }


  // Map Json-oriented document snapshot from firebase to model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      sku: data['SKU'] ?? '',
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      description: data['Description'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      categoryId: data['CategoryId'] ?? '',
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      isFeatured: data['isFeatured'] ?? false,
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      productType: data['ProductType'] ?? '',
    );
  }


}