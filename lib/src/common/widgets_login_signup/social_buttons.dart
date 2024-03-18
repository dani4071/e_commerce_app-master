import 'package:e_commerce_app/src/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:e_commerce_app/src/utils/contants/image_strings.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class danSocialsButton extends StatelessWidget {
  const danSocialsButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(loginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialButton(image: danImage.google, onPress:  ()=> controller.googleSignIn(), ),
        const SizedBox(width: danSizes.spacebtwItems,),
        socialButton(image: danImage.facebook, onPress: () {},),
      ],
    );
  }
}

class socialButton extends StatelessWidget {
  const socialButton({
    super.key, required this.image, required this.onPress
  });

  final String image;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}