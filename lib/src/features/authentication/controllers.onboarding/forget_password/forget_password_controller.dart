import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/shop/screen/password_configuration/reset_password.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordController extends GetxController{
  static forgetPasswordController get instance => Get.find();


  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();


  sendPasswordResetEmail() async {
    try {
      // start loading
      danFullScreenLoader.customLoading();

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        danFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!forgotPasswordFormKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      
      // remove loader
      danFullScreenLoader.stopLoading();
      
      //show success screen
      danLoaders.successSnackBar(title: "Email sent", message: "Email link sent to reset your password");

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));


    } catch (e) {
      // remove loader
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap, 1", message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      danFullScreenLoader.customLoading();

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        danFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      danFullScreenLoader.stopLoading();

      //show success screen
      danLoaders.successSnackBar(title: "Email sent", message: "Email link sent to reset your password");

    } catch (e) {

      // remove loader
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap, 1", message: e.toString());
    }
  }

}