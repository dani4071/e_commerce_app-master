import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/models/user_model.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/user/user_repository.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/re_authenticate_user_screen/delete.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/login.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  // this profile loading is to load while the id is being fetched to display the full name
  final profileLoading = false.obs;

  // for delete user screen
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final Rx<bool> hidePassword = true.obs;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final imageUploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user record. this calls the function in user repository
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {

      // refresh user record
      await fetchUserRecord();

      // if no record already stored
      if (user.value.id.isNotEmpty) {
        if (userCredentials != null) {
          // Convert name to first name and last name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username =
          UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstname: nameParts[0],
            lastname: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      danLoaders.errorSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. you can re save your data in your profile $e");
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(danSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete the account homie?, This action is irreversable, and the user would be deleted permanently",
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: danSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }



  /// Delete User Account
  void deleteUserAccount() async {
    try {
      danFullScreenLoader.customLoading();

      // first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          danFullScreenLoader.stopLoading();
          Get.offAll(() => const loginScreen());
        } else if (provider == 'password') {
          danFullScreenLoader.stopLoading();
          Get.to(() => const reAuthUserLoginFormScreen());
        }
      }
    } catch (e) {
      danFullScreenLoader.stopLoading();
      danLoaders.warningSnackBar(title: "oh snap, we no gree!", message: e.toString());

    }
  }

  /// Upload Profile Image
  Future<void> reAuthenticateEmailandPassword() async {
    try {
      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticatewithEmailandPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      danFullScreenLoader.stopLoading();
      Get.offAll(() => const loginScreen());

    } catch (e) {
      danFullScreenLoader.stopLoading();
      danLoaders.warningSnackBar(title: "oh snap, wee!", message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      // could be ImageSource. camera too;
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if(image != null){
        imageUploading.value = true;
        //upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // update User Image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        danLoaders.successSnackBar(title: "Congratulations", message: "Your profile image has been uploaded");

      }
    } catch (e) {
      danLoaders.errorSnackBar(title: "oh Snap!!", message: "Something went Wrong: $e");
    }
    finally {
      imageUploading.value = false;
    }

  }
}
