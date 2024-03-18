import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/add_new_address.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/widgets/single_address.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addressScreen extends StatelessWidget {
  const addressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);
    const screenWidth = danHelperFunction.screenWidth;
    const screenHeight = danHelperFunction.screenHeight;

    return Scaffold(

      appBar: danAppBar(
          title: Text(
            "Addresses",
            style: texttheme.bodyMedium,
          ),
          showBackArrow: true),


      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(danSizes.defaultSpace),
          child: Column(
            children: [
              danSinglAddress(selectedAddress: false,),
              danSinglAddress(selectedAddress: true,),
              danSinglAddress(selectedAddress: false,),
              danSinglAddress(selectedAddress: false,),
              danSinglAddress(selectedAddress: false,),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: danColors.primary,
        shape: const CircleBorder(),
        onPressed: () => Get.to(const danAddNewAddress()),
        child: Icon(
          Icons.add,
          color: isDark ? danColors.white : danColors.black,
        ),
      ),
    );
  }
}
