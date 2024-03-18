import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/models/user_model.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/user/user_repository.dart';
import 'package:e_commerce_app/src/features/shop/screen/sign_up/verify_email.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final _authenticationRepository = Get.put(AuthenticationRepository());
  final userRepository = Get.put(UserRepository());

  void signup() async {
    try {
      /// start loading, i dont get willPopScope loading but hopefully ill learn it soon
      // danFullScreenLoader.openLoadingDialog(
      //     "We are processing your information...", danImage.onboardingImage4);

      danFullScreenLoader.customLoading();

      ///check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }


      if (!signupFormKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;}

      if (!privacyPolicy.value) {
        danLoaders.warningSnackBar(
            title: "Accept Privacy Policy!",
            message:
                "In other to create an account you must read and accept the privacy policy"
        );
        return;
      }


      /// Register user in  the firebase Authentication and save user data in the firebase
      final userCredentials = await _authenticationRepository.registerWithEmailandPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstname: firstName.text.trim(),
          lastname: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );

      // call the user repository which we declared up top
      await userRepository.saveUserRecord(newUser);

      danFullScreenLoader.stopLoading();

      // show success message
      danLoaders.successSnackBar(title: "Congratulations", message: "Your account has been Created successfully! Verify email to continue my guy.");


      Get.to(() => verifyEmailScreen(email: email.text.trim(),));
      
      /// SAVE AUTHENTICATED USER DATA IN THE FIREBASE FIRESTORE

    } catch (e) {
      danFullScreenLoader.stopLoading();
      danLoaders.errorSnackBar(title: "oh snap! wahalaa", message: e.toString());
    }
  }
}
