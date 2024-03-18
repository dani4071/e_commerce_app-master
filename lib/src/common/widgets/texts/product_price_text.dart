import 'package:flutter/material.dart';

class danProductPriceText extends StatelessWidget {
  const danProductPriceText({
    super.key,
    required this.price,
    this.currencysign = "\$",
    this.maxline = 1,
    this.isLarge = false,
    this.linethrough = false,
  });

  final String price;
  final String currencysign;
  final int maxline;
  final bool isLarge;
  final bool linethrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencysign + price,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: linethrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(decoration: linethrough ? TextDecoration.lineThrough : null),
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
    );
  }
}
