import 'package:e_commerce_app/src/features/personalization/screen/settings/settings.dart';
import 'package:e_commerce_app/src/features/shop/screen/favourite/favourite.dart';
import 'package:e_commerce_app/src/features/shop/screen/home/home.dart';
import 'package:e_commerce_app/src/features/shop/screen/store/store.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navigationMenu extends StatelessWidget {
  const navigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(navigationController());
    final isDark = danHelperFunction.isDarkMode(context);


    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDark? danColors.dark : danColors.white,
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index) => controller.selectedindex.value = index,
          indicatorColor: isDark? danColors.white.withOpacity(0.1) : danColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Store"),
            NavigationDestination(icon: Icon(Icons.favorite), label: "Favourite"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedindex.value]),
    );
  }
}

class navigationController extends GetxController{
  final Rx<int> selectedindex = 0.obs;
  /// called settings screen cause profile exists inside it
  final screens = [ const homeScreen(),const storeScreen(),const favouriteScreen(),const settingsScreen()];
}

