import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/custom_shapes/containers/circular_container.dart';

class danCouponCode extends StatelessWidget {
  const danCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final isDark = danHelperFunction.isDarkMode(context);

    return danCircularContainer(
      showBorder: true,
      backgroundcolor: isDark ? danColors.dark : danColors.white,
      padding: const EdgeInsets.all(danSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: isDark ? danColors.white.withOpacity(0.5) : danColors.black.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1))
                ),
                onPressed: () {}, child: const Text("Apply")),
          ),
        ],
      ),
    );
  }
}