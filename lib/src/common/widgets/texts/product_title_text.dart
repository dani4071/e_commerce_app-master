import 'package:flutter/material.dart';

class danProductTitleText extends StatelessWidget {
  const danProductTitleText({
    super.key,
    required this.title,
    this.textAlign,
    this.maxline = 2,
    this.smallSize = false,
  });

  final String title;
  final TextAlign? textAlign;
  final int? maxline;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxline,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
