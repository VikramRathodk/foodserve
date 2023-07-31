import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressScreenController extends GetxController {
  //instande of shared preference
  late SharedPreferences preferences;

  String name = "", address = "", pincode = "";

  //Controllers for name ,address and pincode

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  bool isAddressAvailable = false;

  Future<void> getInstances() async {
    preferences = await SharedPreferences.getInstance();

    String address = getString('address');
    if (address.isNotEmpty) {
      isAddressAvailable = true;
    } else {
      isAddressAvailable = false;
    }
    initilizeInfo();
    update();
  }

  void onTap() async {
    if (nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty) {
      saveStrings("name", nameController.text);
      saveStrings("address", addressController.text);
      saveStrings("pincode", pincodeController.text);
      getInstances();
    } else {
      print('All Fields are mendetory');
    }
  }

  void onEdit() async {
    isAddressAvailable = false;

    update();
    await preferences.clear();
  }

  //set string in database
  Future<void> saveStrings(String key, String value) async {
    await preferences.setString(key, value);
  }

  //get the string value

  String getString(String key) => preferences.getString(key) ?? "";

  //initialized strings/data
  void initilizeInfo() {
    name = getString("name");
    address = getString("address");
    pincode = getString("pincode");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInstances();
  }
}
