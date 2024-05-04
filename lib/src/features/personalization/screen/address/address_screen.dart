import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/add_new_address.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/widgets/single_address.dart';
import 'package:e_commerce_app/src/features/shop/controller/address_controller.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
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
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: danAppBar(
          title: Text(
            "Addresses",
            style: texttheme.bodyMedium,
          ),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  // if nothing is passed as the loader then we just use a circle progress indicator
                  final response = danCloudHelperFunctions
                      .checkMultiRecordState(snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => danSinglAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                }),
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
