import 'package:e_commerce_app/src/bindings/general_bindings.dart';
import 'package:e_commerce_app/src/routes/app_routes.dart';
import 'package:e_commerce_app/src/utils/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/src/utils/theme/theme.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: danAppTheme.danlightTheme,
      darkTheme: danAppTheme.dandarkTheme,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.pages,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: danColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white,),
        ),
      ),
    );
  }
}
