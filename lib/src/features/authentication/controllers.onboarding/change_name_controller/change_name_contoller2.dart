import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories.authentication/user/user_repository.dart';
import '../../../../utils/Network/network_manager.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../../personalization/screen/profile/profile.dart';


class updateNameController2 extends GetxController{
  static updateNameController2 get instance => Get.find();

  var firstname2 = TextEditingController();
  var lastname2 = TextEditingController();
  final userController2 = UserController.instance;
  final userRepository2 = Get.put(UserRepository());
  GlobalKey<FormState> upateNameKey2 = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName2();
    super.onInit();
  }

  Future<void> initializeName2() async {
    firstname2.text = userController2.user.value.firstname;
    lastname2.text = userController2.user.value.lastname;
  }

  Future<void> updateUserName2() async {
    try{
      /// when you upgrade your flutter try and learn popScope loading, see => danFullScreenLoader
      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }

      if (!upateNameKey2.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;}

      // update users first name and last name in firebase firestore
      Map<String, dynamic> name = {'Firstname': firstname2.text.trim(), 'LastName': lastname2.text.trim()};
      await userRepository2.updateSingleField(name);

      // update the Rx User value
      userController2.user.value.firstname = firstname2.text.trim();
      userController2.user.value.lastname = lastname2.text.trim();

      // remove loader
      danFullScreenLoader.stopLoading();

      danLoaders.successSnackBar(title: "Congratulations", message: "Your name has been updated sir!");

      //Move to the previous screen
      Get.off(() => const profileScreen());
      // await userRepository2.updateUserDetails();

    } catch(e) {
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap boss", message: e.toString());
    }

  }



  }