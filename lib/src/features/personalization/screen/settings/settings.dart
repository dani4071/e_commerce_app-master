import 'package:e_commerce_app/src/common/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/personalization/screen/settings/widget/settings_menu_tile.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/address_screen.dart';
import 'package:e_commerce_app/src/features/shop/screen/order/order%20_screen.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile/widgets/user_profile_tile.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = danHelperFunction.screenHeight();
    final screenwidth = danHelperFunction.screenWidth();
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    final controller = Get.put(AuthenticationRepository());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              danPrimaryHeaderContainer(
                child: Column(
                  children: [
                    // homeAppBar(texttheme: texttheme, subtitle: "Account", showIcon: false,),
                    danAppBar(title: Text("Account", style: texttheme.headlineMedium!.apply(color: Colors.white),), ),

                    danUserProfileTile(texttheme: texttheme),

                    const SizedBox(
                      height: danSizes.spacebtwsections,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: danSizes.spacebtwItems,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    danSectionHeading(texttheme: texttheme, title: "Account Settings"),
                    danSettingsMenuTile(title: 'My Addresses', subtitle: 'Seshopping delivery address', leadingIcon: Icons.add_chart_sharp, onPress: () => Get.to(const addressScreen()),),
                    const danSettingsMenuTile(title: 'My Cart', subtitle: 'Add, remove products and move to check to checkout', leadingIcon: Icons.add_chart_sharp,),
                    danSettingsMenuTile(title: 'My Orders', subtitle: 'In-progress and Completed Orders', leadingIcon: Icons.add_chart_sharp, onPress: () => Get.to(const orderScreen()),),
                    const danSettingsMenuTile(title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account', leadingIcon: Icons.add_chart_sharp,),
                    const danSettingsMenuTile(title: 'My Coupons', subtitle: 'List of sll thr discounted coupons', leadingIcon: Icons.add_chart_sharp,),
                    const danSettingsMenuTile(title: 'Notification', subtitle: 'Set any kind of notification message', leadingIcon: Icons.add_chart_sharp,),
                    const danSettingsMenuTile(title: 'Account Privacy', subtitle: 'Manage data usage and connect', leadingIcon: Icons.add_chart_sharp,),

                    const SizedBox(height: danSizes.spacebtwsections,),
                    danSectionHeading(texttheme: texttheme, title: "Account Settings"),
                    const SizedBox(height: danSizes.spacebtwItems,),

                    const danSettingsMenuTile(title: 'Load Data', subtitle: 'Upload data to your cloud firebase', leadingIcon: Icons.add_chart_sharp,),
                    const danSettingsMenuTile(title: 'Geolocation', subtitle: 'Set recommendation based on location', leadingIcon: Icons.add_chart_sharp,
                      trailing: Switch(value: false, onChanged: null),),
                    const danSettingsMenuTile(title: 'Safe Mode', subtitle: 'Search result is safe for all ages', leadingIcon: Icons.add_chart_sharp,
                      trailing: Switch(value: true, onChanged: null),),const danSettingsMenuTile(title: 'HD-Quality', subtitle: 'Set image quality to be seen', leadingIcon: Icons.add_chart_sharp,
                      trailing: Switch(value: true, onChanged: null),),

                    const SizedBox(height: danSizes.spacebtwsections,),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        child: const Text("Logout"),
                        onPressed: () => controller.logoutUser(),
                      ),
                    ),

                    const SizedBox(height: danSizes.spacebtwsections ,),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


