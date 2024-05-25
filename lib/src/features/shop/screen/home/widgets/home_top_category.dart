import 'package:e_commerce_app/src/common/widgets/images/dan_vertical_image_text.dart';
import 'package:e_commerce_app/src/common/widgets/shimmer_annimation_loading/category_shimmer_effect.dart';
import 'package:e_commerce_app/src/features/shop/controller/category_controller.dart';
import 'package:e_commerce_app/src/features/shop/screen/sub_category/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class popularCategories extends StatelessWidget {
  const popularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final list = popularCategoriesModel.list;
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const danCategoryShimmer();

      if (categoryController.popularCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
          height: 80,
          child: ListView.builder(
              // itemCount: 9,
              itemCount: categoryController.popularCategories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,

              /// you can use dan vertical image text to archive the below
              itemBuilder: (context, index) {
                final category = categoryController.popularCategories[index];
                // return SizedBox(
                //   width: 60,
                //   height: 45,
                //   child: Column(
                //     children: [
                //       Container(
                //           height: 45,
                //           width: 45,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(100),
                //           ),
                //           child: Image(
                //             image: AssetImage(category.image),
                //           )),
                //       Text(category.name)
                //     ],
                //   ),
                // );

                // we pass the category in here
                return danVerticalImageText(
                  image: category.image,
                  isNetworkImage: true,
                  title: category.name,
                  onTap: () => Get.to(subCategoryScreen(
                    category: category,
                  )),
                );
              }));
    });
  }
}

class popularCategoriesModel {
  final String title;
  final String image;
  final VoidCallback? onpress;

  popularCategoriesModel(this.image, this.title, this.onpress);

  static List<popularCategoriesModel> list = [
    popularCategoriesModel("Sports", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Furniture", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Electronics", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Clothes", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Animals", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Shoes", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Shoes", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Shoes", "assets/logos/googleLogo.png", null),
    popularCategoriesModel("Shoes", "assets/logos/googleLogo.png", null),
  ];
}
