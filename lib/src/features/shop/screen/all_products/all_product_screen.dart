import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/common/widgets/products/sortable/sortable_product.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/vertical_product_shimmer.dart';
import 'package:e_commerce_app/src/features/shop/controller/product/all_product_controller.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class allProductsScreen extends StatelessWidget {
  const allProductsScreen({super.key, required this.title, this.query, this.futureMethod});


  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final controller = Get.put(AllProductController());

    return Scaffold(
      appBar: danAppBar(
          title: Text(
            title,
            style: texttheme.bodyLarge,
          ),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(danSizes.spacebtwItems / 2),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // check the state of the futureBuilder snapshot

              const loader = danVerticalProductShimmer();
              // if(snapshot.connectionState == ConnectionState.waiting) {
              //   return loader;
              // }
              //
              //
              // if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              //   return const Center(child: Text("No Data Found"),);
              // }
              //
              //
              // if(snapshot.hasError) {
              //   return const Center(child: Text("Somethung went wrong"),);
              // }

              // product found
              final widget = danCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              if (widget != null) return widget;

              final products = snapshot.data!;

              return danSortableProducts(products: products);
            }
          ),
        ),
      ),
    );
  }
}


