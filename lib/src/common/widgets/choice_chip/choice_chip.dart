import 'package:e_commerce_app/src/common/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class danChoiceChip extends StatelessWidget {
  const danChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = danHelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text, style: Theme.of(context).textTheme.bodySmall,),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null ),
        avatar: isColor ? danCircularContainer(width: 55, height: 55, backgroundcolor: danHelperFunction.getColor(text)!) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ?  danHelperFunction.getColor(text) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        // makes icon in the center
        padding: isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
