
import 'package:flutter/material.dart';


///
///
/// MAYBE WHEN I FIGURE OUT WHICH DATA TYPE STORES VALIDATORS I COULD USE THIS
///
///
///
///


class textFields extends StatelessWidget {
  const textFields({
    super.key,
    required this.title,
    required this.iconn,
    this.siconn,
    this.forpass = false,
    // required this.controllers,
  });

  final String title;
  final IconData iconn;
  final IconData? siconn;
  final bool forpass;
  // final TextEditingController controllers;
  /// this here might not work

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    // final controller = Get.put(SignupController());

    return Form(
      // key: controller.signupFormKey,
      child: TextFormField(
        obscureText: forpass? true : false,
        // controller: controllers,
        expands: false,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: texttheme.bodyMedium,
          prefixIcon: Icon(iconn),
          suffixIcon: Icon(siconn),
        ),
      ),
    );
  }
}
