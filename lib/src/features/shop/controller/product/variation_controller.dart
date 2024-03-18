import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_variation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;


  /// -- Select Attributes, and variations
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    // when attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttribute = Map<String, dynamic>.from(this.selectedAttributes);
  }



}