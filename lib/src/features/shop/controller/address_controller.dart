import 'package:e_commerce_app/src/common/widgets/loaders/snackbar.dart';
import 'package:e_commerce_app/src/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/src/data/repositories.authentication/address/address_repository.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/add_new_address.dart';
import 'package:e_commerce_app/src/features/personalization/screen/address/widgets/single_address.dart';
import 'package:e_commerce_app/src/features/shop/model/address_model.dart';
import 'package:e_commerce_app/src/popups/full_screen_loader.dart';
import 'package:e_commerce_app/src/utils/Network/network_manager.dart';
import 'package:e_commerce_app/src/utils/contants/sizes.dart';
import 'package:e_commerce_app/src/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressController extends GetxController{
  static AddressController get instance => Get.find();



  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();


  // doesnt really do anything specific except to help us re-draw our screen when a change is made video 50 --19:25
  // that is why it was put in the future builder key and its toggled over here
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());


  Future<List<AddressModel>> getAllUserAddresses() async {
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


  /// totally understood this but if you need to understand it again check video 50 -- 14:50
  Future selectAddress(AddressModel newSelectedAddress) async {
    try{


      danFullScreenLoader.customCircleProgressIndicator();

      // danFullScreenLoader.customLoading();
      // clear the "selected" field first from the database
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;


      // set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      //remove loader
      // danFullScreenLoader.stopLoading();
      Get.back();


    } catch (e) {
      danLoaders.errorSnackBar(title: "Error in selection", message: e.toString());
      return [];
    }
  }


  /// Add new Address
  Future addNewAddress() async {

    try{
      // start loading
      //danFullScreenLoader.openLoadingDialog("Storing Address...", danImage.loadingImage1);
      danFullScreenLoader.customLoading();

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        danFullScreenLoader.stopLoading();
        return;
      }


      // form Validation
      if(!addressFormKey.currentState!.validate()) {
        danFullScreenLoader.stopLoading();
        return;
      }


      // save Address data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);


      // Update selected address status
      address.id = id;
      await selectAddress(address);

      //remove loader
      danFullScreenLoader.stopLoading();


      // show success message
      danLoaders.successSnackBar(title: "Congratulations", message: "Your address has been saved successfully");


      // refresh Address data
      // doesnt really do anything specific except to help us re-draw our screen when a change is made video 50 --19:25
      // that is why it was put in the future builder key and its toggled over here
      refreshData.toggle();


      // reset fields
      resetFormField();


      // redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      danLoaders.errorSnackBar(title: "Failed to upload, address controller", message: e.toString());
    }
  }


  /// function to reset form fields
  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    state.clear();
    city.clear();
    postalCode.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(danSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                danSectionHeading(texttheme: Theme.of(context).textTheme, title: "Select Address", showbutton: false,),
                FutureBuilder(
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      /// Helper function: Handle loader, No record or Error message
                      final response = danCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if(response != null) return response;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => danSinglAddress(
                            address: snapshot.data![index],
                            onTap: () async {
                              selectedAddress(snapshot.data![index]);
                              Get.back();
                            }),
                      );
                    },
                ),
                const SizedBox(height: danSizes.defaultSpace * 2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => Get.to(() => const danAddNewAddress()), child: const Text("Add New Address"),),
                )
              ],
            ),
          ),
        )
    );
  }


}