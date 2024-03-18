import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// manages the network connectivity status and provides method to check and handle connectivity changes.
class NetworkManager extends GetxController {

  static NetworkManager get instance => Get.find();


  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

 /// Initialize the network manager and set up a stream to continously check the internet status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity and show a relevant pop up for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if(_connectionStatus.value == ConnectivityResult.none) {
      danLoaders.warningSnackBar(title: "No Internet Connection");
    }
  }

  ///check the internet connection status.
/// return true if connected, false otherwise.

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if(result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

  /// dispose or close thr active connectivity stream.



}