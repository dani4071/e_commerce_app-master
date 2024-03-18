import 'package:e_commerce_app/src/features/shop/screen/review/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class danOverallProductRating extends StatelessWidget {
  const danOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final texttheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(flex: 3, child: Text("4.6", style: texttheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              danRatingProgressIndicator(text: '5', value: 1.0,),
              danRatingProgressIndicator(text: '4', value: 0.8,),
              danRatingProgressIndicator(text: '3', value: 0.6),
              danRatingProgressIndicator(text: '2', value: 0.4,),
              danRatingProgressIndicator(text: '1', value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}