import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/banner/banner_repository.dart';
import 'package:get/get.dart';
import '../model/banner_model.dart';

class bannerController extends GetxController {
  static bannerController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  // Update Page novigation Dots
  void updatePageIndicator (index){
    carouselCurrentIndex.value = index;
  }


  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {

    try{

      //show loader while loading banners
      isLoading.value = true;

      //gets the whole banner and saves it on the above variable banners.
      //fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final bannners = await bannerRepo.fetchBanners(); // this fetch is for the repository calling

      // assign everything here
       banners.assignAll(bannners);


    } catch (e) {
      danLoaders.errorSnackBar(title: "Oh Snap? Banner", message: e.toString());
    } finally {
      // remove looader
      isLoading.value = false;
    }


  }




}
