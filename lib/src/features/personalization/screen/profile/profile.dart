import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/images/dan_circular_image.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/change_name/change_name.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/widgets/profile_menu.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme
        .of(context)
        .textTheme;
    final controller = UserController.instance;


    return Scaffold(
      appBar: const danAppBar(showBackArrow: true, title: Text("Profile"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.defaultSpace / 2),
          child: Column(
            children: [

              // profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : danImage.google;
                      return danCircularImage(
                        image: image, height: 80, width: 80,isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    // SizedBox(height: danSizes.spacebtwItems,),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text(
                        "Change Profile pcture", style: texttheme.bodySmall,),),
                  ],
                ),
              ),

              const SizedBox(height: danSizes.spacebtwItems / 2,),
              const Divider(),
              const SizedBox(height: danSizes.spacebtwItems,),

              // profile info
              danSectionHeading(
                  texttheme: texttheme, title: "Profile Information"),
              const SizedBox(height: danSizes.spacebtwItems,),

              danProfileMenu(leading: 'Name',
                name: controller.user.value.fullName,
                onPressed: () => Get.to(() => const changeNameScreen()),),
              danProfileMenu(leading: 'Username',
                name: controller.user.value.username,
                onPressed: () {},),


              const SizedBox(height: danSizes.spacebtwsections,),
              const Divider(),
              const SizedBox(height: danSizes.spacebtwItems,),

              // personal info
              danSectionHeading(
                  texttheme: texttheme, title: "Personal Information"),
              const SizedBox(height: danSizes.spacebtwItems,),

              danProfileMenu(leading: 'ID',
                  name: controller.user.value.id,
                  onPressed: () {},
                  trailing: Icons.copy),
              danProfileMenu(leading: 'Email',
                name: controller.user.value.email,
                onPressed: () {},),
              danProfileMenu(leading: 'PhoneNumber',
                name: controller.user.value.phoneNumber,
                onPressed: () {},),
              danProfileMenu(leading: 'Gender',
                name: controller.user.value.lastname,
                onPressed: () {},),
              danProfileMenu(leading: 'Date of Birth',
                name: controller.user.value.firstname,
                onPressed: () {},),

              const SizedBox(height: danSizes.spacebtwsections),
              const Divider(),
              const SizedBox(height: danSizes.spacebtwItems,),

              Center(
                child: TextButton(
                  child: Text("Close Account",
                    style: texttheme.bodySmall!.apply(color: Colors.red),),
                  onPressed: () => controller.deleteAccountWarningPopup(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


