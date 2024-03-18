import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/category/category_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/category_model.dart';
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
}