import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class loginController extends GetxController {
  static loginController get instance => Get.find();

/// controllers are also used to separate design and back end, that way the code remains neat.

  final email = TextEditingController();
  final password = TextEditingController();
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = false.obs;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final localStorage = GetStorage();
  final userController = Get.put(UserController());



  Future<void> signInWithEmailandPassword() async {

    try{
      /// when you upgrade your flutter try and learn popScope loading, see => danFullScreenLoader
      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }

      if (!loginKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;}

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      danFullScreenLoader.stopLoading();


      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap, you no fit login o", message: e.toString());
    }
  }


  Future<void> googleSignIn() async {
    try{

      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      /// storing data should not be the responsibility of login controller, it is the responsibility of userController
      // save user record
      await userController.saveUserRecord(userCredentials);

      //remove loader
      danFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();


    } catch (e){
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "Oh Snap", message: "Google sign in no gree");
    }
  }


}