import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/user/user_repository.dart';
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/profile.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class updateNameController extends GetxController{


  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> upateNameKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializeName();
  }



  Future<void> initializeName() async {
    firstname.text = userController.user.value.firstname;
    lastname.text = userController.user.value.lastname;
  }

  Future<void> updateUserName() async {
    try{
      /// when you upgrade your flutter try and learn popScope loading, see => danFullScreenLoader
      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }

      if (!upateNameKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;}

      // update users first name and last name in firebase firestore
      Map<String, dynamic> name = {'Firstname': firstname.text.trim(), 'LastName': lastname.text.trim()};
      await userRepository.updateSingleField(name);

      // update the Rx User value
      userController.user.value.firstname = firstname.text.trim();
      userController.user.value.lastname = lastname.text.trim();

      // remove loader
      danFullScreenLoader.stopLoading();

      danLoaders.successSnackBar(title: "Congratulations", message: "Your name has been updated sir!");

      //Move to the previous screen
      Get.off(() => const profileScreen());
    } catch(e) {
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap boss", message: e.toString());
    }



  }



}