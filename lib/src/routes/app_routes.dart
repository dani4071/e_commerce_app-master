import 'package:e_commerce_app/src/features/personalization/screen/address/address_screen.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/profile.dart';
import 'package:e_commerce_app/src/features/personalization/screen/settings/settings.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/cart_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/checkout/checkout_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/favourite/favourite.dart';
import 'package:e_commerce_app/src/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/src/features/shop/screen/login/login.dart';
import 'package:e_commerce_app/src/features/shop/screen/order/order%20_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/password_configuration/forget_password.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/review_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/sign_up/sign_up_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/sign_up/verify_email.dart';
import 'package:e_commerce_app/src/features/shop/screen/store/store.dart';
import 'package:e_commerce_app/src/routes/routes.dart';
import 'package:get/get.dart';

import '../features/shop/screen/onboarding/onboarding.dart';


class AppRoutes {
  static final pages = [

    GetPage(name: danRoutes.home, page: () => const homeScreen()),
    GetPage(name: danRoutes.store, page: () => const storeScreen()),
    GetPage(name: danRoutes.favourites, page: () => const favouriteScreen()),
    GetPage(name: danRoutes.settings, page: () => const settingsScreen()),
    GetPage(name: danRoutes.productReviews, page: () => const productReviewScreen()),
    GetPage(name: danRoutes.order, page: () => const orderScreen()),
    GetPage(name: danRoutes.checkOut, page: () => const checkOutScreen()),
    GetPage(name: danRoutes.cart, page: () => const cartScreen()),
    GetPage(name: danRoutes.userProfile, page: () => const profileScreen()),
    GetPage(name: danRoutes.userAddress, page: () => const addressScreen()),
    GetPage(name: danRoutes.signup, page: () => const signUpScreen()),
    GetPage(name: danRoutes.verifyEmail, page: () => const verifyEmailScreen()),
    GetPage(name: danRoutes.signIn, page: () => const loginScreen()),
    GetPage(name: danRoutes.forgetPassword, page: () => const forgetPasswordScreen()),
    GetPage(name: danRoutes.onBoarding, page: () => const onboarding()),


  ];


}