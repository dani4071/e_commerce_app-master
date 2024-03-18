import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/product/product_repository.dart';
import 'package:get/get.dart';
import '../../../../utils/contants/enums.dart';
import '../../model/product_model.dart';


class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }


  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      //fetch product
      final products = await productRepository.getFeaturedProducts();

      //assign product
      featuredProducts.assignAll(products);








    } catch (e) {
      danLoaders.errorSnackBar(title: "oh Snappp", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }


 // Get the product price or price range for variation
  String getProductPrice (ProductModel product) {

    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {

      // samll calculation to check smallest price
      for(var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToconsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;


        // update smallest and largest prices
        if(priceToconsider < smallestPrice){
          smallestPrice = priceToconsider;
        }

        if(priceToconsider > largestPrice) {
          largestPrice = priceToconsider;
        }
      }

      // if smallest and largest price are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // otherwise return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

 /// calculate discount percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if (salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    // formula for percentage is 21/50 * 100
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    // toStringAsFixed means that youd avoid all those zeros at the end of some percentage
    return percentage.toStringAsFixed(0);
  }

  /// check if product is in stock
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

}