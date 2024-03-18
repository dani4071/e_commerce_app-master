import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';


class ImageController extends GetxController{
  static ImageController get instance => Get.find();



  // variables
  RxString selectedProductImage = "".obs;

  /// Get all images from prodyct and variation

  List<String> getAllproductImages(ProductModel product) {

    // use set to add unique images only
    Set<String> images = {};

    // load thumbnail images
    images.add(product.thumbnail);

    // Assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;


    //Get all images from thr product model if not null
    if(product.images != null) {
      images.addAll(product.images!);
    }



    // GET ALL IMAGES from the product variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }


  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.symmetric(vertical: danSizes.defaultSpace * 2, horizontal: danSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: danSizes.spacebtwItems,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    //width: 150,
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Close"),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }


}