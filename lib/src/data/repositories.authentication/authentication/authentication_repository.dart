import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/user/user_repository.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/login.dart';
import 'package:e_commerce_app/src/features/shop/screen/onboarding/onboarding.dart';
import 'package:e_commerce_app/src/features/shop/screen/sign_up/verify_email.dart';
import 'package:e_commerce_app/src/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// remeber to on multidex support on the terminal
  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;


  /// Get Authenticated User Data
  User get authUser => _auth.currentUser!;
  //User? get authUser => _auth.currentUser;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // redirect to the appropriate screen
    screenRedirect();
  }

  /// function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // if the user is logged in
      if (user.emailVerified) {
        //if the users email is verified, navigate to thr navigation menu

        // Initialize user specific storage
        await danLocalStorage.init(user.uid);

        // if the users email is verified, navigate to the verifyEmailScreen
        Get.offAll(() => const navigationMenu());
      } else {
        //if the users email is not verified, navigate to thr verify screen
        Get.offAll(() => verifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // if (kDebugMode) {
      //   print("======================== GET Storage ============");
      //   print(deviceStorage.read("IsFirstTime"));
      // }
      deviceStorage.writeIfNull("IsFirstTime", true);
      // if (kDebugMode) {
      //   print("======================== GET Storage auth 2 ============");
      //   print(deviceStorage.read("IsFirstTime"));
      // }
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const loginScreen())
          : Get.offAll(() => const onboarding());
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailandPassword(String email,
      String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 1";
    } on FirebaseException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      throw const danException().message;
      // throw "Something went wrong. please try again 3";
    } on PlatformException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }

  /// [EmailAuthentication] - MAIL VERIFICATION MESSAGE
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 1";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 3";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email,
      String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw danException(e.code).message;
      // throw "Something went wrong. please try again 1 this";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 3";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }


  /// [GoogleAuthentication] - REGISTER
  Future<UserCredential> signInWithGoogle() async {
    try {
      // trigger the authentication flow( -GoogleSignIn- pops up the window i believe)
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount
          ?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in , return the UserCredentials
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 1";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 3";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }


  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 1";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 3";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }


  /// [REAUTHENTICATE] - so we could delete. according to firebase you must reAuth before you could delete
  Future<void> reAuthenticatewithEmailandPassword(String email, String password) async {
    try {

      // create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // re-authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 111";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 222";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 333";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 444";
    }
    catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }


  /// [LOGOUTUSER] - Valid for any authentication
  Future<void> logoutUser() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const loginScreen());
    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 1";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 2";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 3";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 4";
    } catch (e) {
      throw "Something went wrong. please try again 5";
    }
  }


  /// [DELETEUSER] - Remove user Auth and Firebase Account
  Future<void> deleteAccount() async {
    try {

      // first delete the firestore first then the authenticated user so you'd be able to get the id
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 11";
    } on FirebaseException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 22";
    } on FormatException catch (_) {
      // throw danException().message;
      throw "Something went wrong. please try again 33";
    } on PlatformException {
      // throw danException(e.code).message;
      throw "Something went wrong. please try again 44";
    }
    catch (e) {
      throw "Something went wrong. please try again 55";
    }
  }
}
