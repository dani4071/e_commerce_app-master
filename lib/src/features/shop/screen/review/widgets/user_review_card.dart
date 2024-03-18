import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/features/shop/screen/review/widgets/rating_bar_indicator.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/contants/text_strings.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class userReviewCard extends StatelessWidget {
  const userReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    final isDark = danHelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(danImage.imageNft),
                ),
                const SizedBox(
                  width: danSizes.spacebtwItems,
                ),
                Text(
                  "John Doe",
                  style: texttheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        Row(
          children: [
            const danRatingBarIndicator(value: 4.4),
            const SizedBox(
              width: danSizes.spacebtwItems,
            ),
            Text(
              "03 Oct, 2024",
              style: texttheme.bodyMedium,
            ),
          ],
        ),
        const ReadMoreText(
          danTexts.descriptionText,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more",
          trimExpandedText: "Show Less",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: danSizes.spacebtwsections / 2,
        ),
        danCircularContainer(
          backgroundcolor: isDark ? danColors.darkerGrey : danColors.softGrey,
          child: Padding(
            padding: const EdgeInsets.all(danSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dan's Store",
                      style: texttheme.titleMedium,
                    ),
                    Text(
                      "03 Oct, 2024",
                      style: texttheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: danSizes.spacebtwsections,
                ),
                const ReadMoreText(
                  danTexts.descriptionText,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more",
                  trimExpandedText: "Show Less",
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  lessStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: danSizes.spacebtwsections,
        ),
      ],
    );
  }
}
