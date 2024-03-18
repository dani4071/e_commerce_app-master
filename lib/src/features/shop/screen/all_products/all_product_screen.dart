import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class allProductsScreen extends StatelessWidget {
  const allProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: danAppBar(
          title: Text(
            "Popular Product",
            style: texttheme.bodyLarge,
          ),
          showBackArrow: true),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(danSizes.spacebtwItems / 2),
          child: danSortableProducts(),
        ),
      ),
    );
  }
}


