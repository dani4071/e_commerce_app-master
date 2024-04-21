import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/address/address_repository.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/authentication/authentication_repository.dart';
import 'package:e_commerce_app/src/features/shop/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());


  Future<List<AddressModel>> allUserAddresses() async {
    try{

      final addresses = await addressRepository.fetchUserAddress();
      // if we receive any element that has selectedAddress as true we'd return the first where, if not the orElse would trigger which returns an empty model
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      danLoaders.errorSnackBar(title: "Address not found, address controller", message: e.toString());
      return [];
    }

  }


}