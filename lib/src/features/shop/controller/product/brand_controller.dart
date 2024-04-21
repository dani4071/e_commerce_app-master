import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/brand/brand_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/brand_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:get/get.dart';

import '../../../../data/repositories.authentication/product/product_repository.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();



  RxBool isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());
  final productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }



  Future<void> getFeaturedBrands() async {

    try {

      // show loader while loading brands
      isLoading.value = true;


      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured  ?? false).take(4));

    } catch (e) {
      danLoaders.errorSnackBar(title: "oh snap", message: e.toString());
    } finally {
      // stop loader
      isLoading.value = false;
    }
  }





  /// -- Get Brands fot category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try{

      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      danLoaders.errorSnackBar(title: "oh snap!", message: e.toString());
      return [];
    }
  }




  /// Get brand specific products from your data source

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {

    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      danLoaders.errorSnackBar(title: "Oh snap!", message: e.toString());
      return [];
    }
  }
}