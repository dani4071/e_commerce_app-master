import 'package:e_commerce_app/src/common/widgets/appbar_tabbar/appbar.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/widgets/overall_rating_progress_indicator.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/widgets/rating_bar_indicator.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/widgets/user_review_card.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class productReviewScreen extends StatelessWidget {
  const productReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final screenWidth = danHelperFunction.screenWidth();
    final screenHeight = danHelperFunction.screenHeight();

    return Scaffold(

        appBar: danAppBar(
          title: Text("Review and Ratings", style: texttheme.bodyMedium,),
          showBackArrow: true,
        ),


        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(danSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  danTexts.forgotPasswordSubTitle,
                  style: texttheme.bodyMedium,
                ),
                const SizedBox(
                  height: danSizes.spacebtwItems,
                ),
                const danOverallProductRating(),
                const SizedBox(
                  height: danSizes.spacebtwItems,
                ),

                //star star star

                const danRatingBarIndicator(value: 3.5,),
                Text("12,536", style: texttheme.bodyMedium,),

                const SizedBox(
                  height: danSizes.spacebtwsections,
                ),

                const userReviewCard(),
                const userReviewCard(),
                const userReviewCard(),
                const userReviewCard(),

              ],
            ),
          ),
        ));
  }
}




