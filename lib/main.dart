import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {

  // add widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // getX local storage
  await GetStorage.init();

  // await splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  // initialize firebase and Authentication repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()),
  );



  runApp(const MyApp());
}