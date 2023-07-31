// Todos:
// 1. work on orderDetials on Address screen
// 2. use shared prefernce to store address data
// 3. confirm order details and make payment gateway using razerpay api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodserve/Reuseable/editbox.dart';
import 'package:foodserve/controllers/address_controller.dart';
import 'package:foodserve/pages/confirm_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScrren extends StatelessWidget {
  AddressScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressScreenController>(
      init: AddressScreenController(),
      builder: (controller) {
        if (controller.isAddressAvailable) {
          return AddressDetailsScreen();
        } else {
          return EditAddressScreen();
        }
      },
    );
  }
}

//edit details screen
class EditAddressScreen extends StatelessWidget {
  EditAddressScreen({super.key});

  final editController = Get.find<AddressScreenController>();

  @override
  Widget build(BuildContext context) {
    return editDetails();
  }

  Widget editDetails() {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back to homepage
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(Icons.arrow_back_ios)),
                  ),

                  Text(
                    "Edit Address",
                    style: GoogleFonts.breeSerif(
                      fontSize: 18.0,
                    ),
                  ),
                  //more about
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(Icons.person)),
                ],
              ),
            ),
            //name oƒ user
            MyWidget(
              height: 80,
              child: TextField(
                controller: editController.nameController,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                maxLines: 1,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text("Name"),
                  hintText: "Enter your Name here",
                ),
              ),
            ),
            //address
            MyWidget(
              height: 150,
              child: TextField(
                // onChanged: _onChanged,
                controller: editController.addressController,
                inputFormatters: [LengthLimitingTextInputFormatter(60)],
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text("Address"),
                  hintText: "Enter your Address here",
                  // counter: Obx(() => Text("${controller.counter}")),
                ),
              ),
            ),

            //pincode
            MyWidget(
              height: 80,
              child: TextField(
                controller: editController.pincodeController,
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  label: Text("Picode"),
                  hintText: "Enter your Pincode here",
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            //confirm order button
            Container(
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(15.0)),
              child: MaterialButton(
                onPressed: () {
                  editController.onTap();
                },
                child: Text(
                  "Save Details",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.breeSerif(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

//Address details screen
class AddressDetailsScreen extends StatelessWidget {
  AddressDetailsScreen({super.key});
  final email = FirebaseAuth.instance.currentUser!.email;
  final addController = Get.find<AddressScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //app Bar Description
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back to homepage
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(Icons.arrow_back_ios)),
                  ),

                  Text(
                    "Address",
                    style: GoogleFonts.breeSerif(
                      fontSize: 18.0,
                    ),
                  ),
                  //more about
                  Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(Icons.person)),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            //Address details name,city and pincode

            Container(
              width: 400,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Name :  ${addController.name}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Email :  ${email}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Moobile No :",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Address :  ${addController.address}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Pincode : ${addController.pincode} ",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),

                  //edit address  button
                  Container(
                    width: 300,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: MaterialButton(
                      onPressed: () {
                        addController.onEdit();
                      },
                      child: Text(
                        "Edit Details",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.breeSerif(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25.0,
            ),

            //procced to pay address  button
            Container(
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(15.0)),
              child: MaterialButton(
                onPressed: () {
                  Get.to(() => ConfirmScreen());
                },
                child: Text(
                  "Confirm Order",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.breeSerif(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
