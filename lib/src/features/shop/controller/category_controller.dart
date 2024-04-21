import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/category/category_repository.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/product/product_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
import 'package:e_commerce_app/src/features/shop/model/product_model.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();


  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> popularCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      // show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source (Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategory();


      // update the categories list
      allCategories.assignAll(categories);

      // filter for popular categories
      popularCategories.assignAll(
          allCategories.where((category) => category.isFeatured &&
              category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      danLoaders.errorSnackBar(title: "oh snap!", message: "nna ehh $e");
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

  /// load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subcategories = await _categoryRepository.getSubCategories(categoryId);
      return subcategories;
    } catch (e) {
      danLoaders.errorSnackBar(title: "Oh damn", message: e.toString());
      return [];
    }

  }


  /// Get category or sub-category products
Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      // fetch limited (4) products each category
      final products = await ProductRepository.instance.getProductsForCategory(
          categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      danLoaders.errorSnackBar(
          title: "Ohps something went wrong", message: e.toString());
      return [];
    }
  }
}


