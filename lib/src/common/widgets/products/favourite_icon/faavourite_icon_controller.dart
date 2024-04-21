import 'dart:convert';

import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/product/product_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:e_commerce_app/src/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';


class FavouriteController extends GetxController {
 static FavouriteController get instance => Get.find();

 /// varables
 final favourites = <String, bool>{}.obs;

 @override
  void onInit() {
  super.onInit();
  initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
  final json = danLocalStorage.instance().readData("favorites");
  if (json != null) {
   final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
   favourites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
   }
  }


  bool isFavourite(String productId) {
  return favourites[productId] ?? false;
  }

  // this will create the key value pair
  void toggleFavoriteProduct(String productId) {
   if(!favourites.containsKey(productId)){
    favourites[productId] = true;
    saveFavoritesToStorage();
    danLoaders.customToast(message: "Product has been added to the wishlist.");
   } else {
    danLocalStorage.instance().removeData(productId);
    favourites.remove(productId);
    saveFavoritesToStorage();
    favourites.refresh();
    danLoaders.customToast(message: "Product has been removed from the wishlist.");
   }
  }



  void saveFavoritesToStorage() {
  final encodedFavorites = json.encode(favourites);
  danLocalStorage.instance().saveData("favorites", encodedFavorites);

  }

  Future<List<ProductModel>> favoriteProducts() async {
  return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }

}