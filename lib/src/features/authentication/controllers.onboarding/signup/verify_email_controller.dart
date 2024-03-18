import 'dart:async';

import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/common/widgets_login_signup/success_screen.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class verifyEmailController extends GetxController {
  static verifyEmailController get instance => Get.find();

  /// send email whenever verify screen appers and set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      danLoaders.successSnackBar(
          title: "Email sent",
          message: "Please check your inbox and verify your email");
    } catch (e) {
      danLoaders.errorSnackBar(title: "oh snap", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      //this statement here means whenever the emailverified is false the code keeps running untill its true then it cancels
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => successScreen(
            image: danImage.loadingImage1,
            title: danTexts.descriptionText,
            subtitle: danTexts.descriptionTextExpanded,
            onpress: () => AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually check if Email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => successScreen(
          image: danImage.loadingImage1,
          title: danTexts.yourAccountCreatedTitle,
          subtitle: danTexts.yourAccountCreatedSubTitle,
          onpress: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
