import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';


class danPrimaryHeaderContainer extends StatelessWidget {
  const danPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = danHelperFunction.screenHeight();
    final screenWidth = danHelperFunction.screenWidth();
    return curvedEdgesWidget(
      child: Container(
        color: danColors.primary,
        child: Stack(
          children: [
            Positioned(
                left: 251,
                top: -166,
                child: danCircularContainer(
                  backgroundcolor: danColors.white.withOpacity(0.1),
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.8,
                )),
            Positioned(
                left: 300,
                top: 40,
                child: danCircularContainer(
                  backgroundcolor: danColors.white.withOpacity(0.1),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                )),
            child
          ],
        ),
      ),
    );
  }
}