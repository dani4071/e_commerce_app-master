import 'package:flutter/material.dart';


class formField extends StatelessWidget {
  const formField({super.key, required this.text, required this.pIcon, this.sIcon});

  final String text;
  final IconData? pIcon, sIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(pIcon), labelText: text, suffixIcon: Icon(sIcon), ),
    );
  }
}