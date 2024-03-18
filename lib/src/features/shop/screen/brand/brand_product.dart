import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/brand/brand_card.dart';
import 'package:e_commerce_app/src/common/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';

class brandProduct extends StatelessWidget {
  const brandProduct({super.key});

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: danAppBar(title: Text("Nike", style: texttheme.bodyLarge,), showBackArrow: true,),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(danSizes.defaultSpace / 2),
          child: Column(
            children: [
              danBrandCard(showBorder: true),
              SizedBox(height: danSizes.defaultSpace,),


              danSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
