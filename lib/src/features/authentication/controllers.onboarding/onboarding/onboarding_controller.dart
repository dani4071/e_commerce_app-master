import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../shop/screen/login/login.dart';


class onboardingController extends GetxController{
  static onboardingController get instance => Get.find();


  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  void updatePageIndicator(index){
    currentPageIndex.value = index;
  }


  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }


  void nextPage(){
    if(currentPageIndex.value == 2){
      final storage = GetStorage();

      if(kDebugMode){
        print("===============================Get Storage Next Button ===============");
        print(storage.read("IsFirstTime"));
      }
      
      storage.write("IsFirstTime", false);

      if(kDebugMode){
        print("===============================Get Storage Next Button ===============");
        print(storage.read("IsFirstTime"));
      }

      Get.to(const loginScreen());

    } else {
      final page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }


  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}