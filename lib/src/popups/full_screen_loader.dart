import 'package:e_commerce_app/src/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class danFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {

    // final screenHeight = danHelperFunction.screenHeight();
    showDialog(
        context: Get.overlayContext!,
        ///PopScope works with the new flutter version, so upgrade, see => video 36, 14:34
        barrierDismissible: false,
        builder: (_) => WillPopScope(
              child: Container(
                color: danHelperFunction.isDarkMode(Get.context!)
                    ? danColors.black
                    : danColors.white,
                width: 123,
                height: 123,
                // width: double.infinity,
                // height: double.infinity,
                child: Column(
                  children: [
                    // SizedBox(height: 250),
                    // SizedBox(height: screenHeight / 2,),
                    danAnimationLoaderWidget(text: text, animation: animation)
                  ],
                ),
              ),
              onWillPop: () async {
                return false;
              },
            ));
  }
  
  
  static customLoading(){
    showDialog(context: Get.overlayContext!, builder: (context){
      // return const Center(child: CircularProgressIndicator(),);
      return const Scaffold(
        //backgroundColor: danHelperFunction.isDarkMode(context) ? danColors.black : danColors.white,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image(image: AssetImage(danImage.loadingImage2,)),
        ),
      );
    }) ;
  }




  /// this s a custom circular progress indicator
  static customCircleProgressIndicator() {
    Get.defaultDialog(
      title: "",
      onWillPop: () async {return false;},
      barrierDismissible: false,
      backgroundColor: Colors.transparent,
      content: const CircularProgressIndicator(),
    );
  }


  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

/// this is that pop to ask are you sure you wan to cancel
// void removeFromCartDialog(int index)
// {
//   Get.defaultDialog(
//     title: "Remove Product",
//     middleText: 'Are you sure you want to remove this product',
//     onConfirm: () {
//       // remove the item from the cart
//       cartItems.removeAt(index);
//       updateCart();
//       danLoaders.customToast(message: 'Product removed from the cart.');
//       Get.back();
//     },
//     onCancel: () => () => Get.back(),
//   );
// }
