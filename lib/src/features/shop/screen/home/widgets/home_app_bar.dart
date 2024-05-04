
import 'package:e_commerce_app/src/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/cart/cart_screen.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/products/carts/cart_menu_icon.dart';
import '../../../../../common/widgets/appbar_tabbar/appbar.dart';
import '../../../../../common/widgets/shimmer_annimation_loading/shimmer_effect.dart';

class homeAppBar extends StatelessWidget {
  const homeAppBar({
    super.key,
    required this.texttheme,
    this.title = "",
    required this.subtitle,
    this.showIcon = true,
  });

  final TextTheme texttheme;
  final String? title;
  final String subtitle;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {

    /// to get the user detail yo display it
    final controller = Get.put(UserController());
    return danAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: texttheme.labelMedium!
                .apply(color: danColors.white.withOpacity(0.6)),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const danShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: texttheme.headlineSmall!.apply(color: danColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        // if (showIcon)
          danCounterIcon(
            texttheme: texttheme,
            onpressed: () => Get.to(const cartScreen()),
            iconColor: danColors.white,
          )
      ],
    );
  }
}
