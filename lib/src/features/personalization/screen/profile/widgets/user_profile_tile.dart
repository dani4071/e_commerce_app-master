import 'package:e_commerce_app/src/common/widgets/images/dan_circular_image.dart';
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/features/personalization/screen/profile/profile.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class danUserProfileTile extends StatelessWidget {
  const danUserProfileTile({
    super.key,
    required this.texttheme,
  });

  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {

    /// since we've called the controller.put before no need saying get.put again
    final controller = UserController.instance;


    return ListTile(
      title: Text( controller.user.value.fullName,
        style:
        texttheme.headlineSmall!.apply(color: Colors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: texttheme.bodyMedium!.apply(color: Colors.white),
      ),
      leading: const danCircularImage(image: danImage.google, width: 50, height: 50,padding: 0,),
      trailing: IconButton(icon: const Icon(Icons.edit_calendar_outlined,
          color: Colors.white), onPressed: () => Get.to(() => const profileScreen())),
    );
  }
}