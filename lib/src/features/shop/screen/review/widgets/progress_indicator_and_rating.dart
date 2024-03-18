import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class danRatingProgressIndicator extends StatelessWidget {
  const danRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {

    final screenWidth = danHelperFunction.screenWidth();
    final texttheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: texttheme.bodyMedium,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: screenWidth * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: danColors.softGrey,
              valueColor: const AlwaysStoppedAnimation(danColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}