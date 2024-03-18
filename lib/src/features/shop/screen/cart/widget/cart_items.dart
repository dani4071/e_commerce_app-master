import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../../common/widgets/products/carts/cart_item.dart';

class cardItems extends StatelessWidget {
  const cardItems({
    super.key,
    this.showaddbutton = true,
  });

  final bool showaddbutton;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: danSizes.defaultSpace,
      ),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const danCardItem(),

          if(showaddbutton) const SizedBox(
            height: danSizes.spacebtwItems,
          ),
          if(showaddbutton) const Row(
            children: [
              SizedBox(
                width: 70,
              ),
              danProductQualityWithAddRemove(),
            ],
          )
        ],
      ),
    );
  }
}
