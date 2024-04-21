import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/product/product_repository.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';


class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();


  final respository = ProductRepository.instance;
  final RxString selectedSortOption = "Name".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;


  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {

    try{
      if(query == null) return [];

      final products = await respository.fetchProductsByQuery(query);

      return products;

    } catch (e) {
      danLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
      return [];
    }
  }


  void sortProducts (sortOption) {

    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case "Name" :
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higher Price" :
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Lower Price" :
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "Newest" :
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case "Sale" :
        products.sort((a, b) {
          if(b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the products List
    this.products.assignAll(products);
    sortProducts("Name");
  }

}