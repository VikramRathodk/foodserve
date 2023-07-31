import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/confirm_order_controller.dart';

class ConfirmScreen extends StatelessWidget {
  ConfirmScreen({super.key});
  final controller = Get.put(ConfirmOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            //app bar
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
                    "Order Confirmation ",
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

            Container(
              width: 400,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          "Address Details",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.breeSerif(
                              fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Name :  ${controller.name}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Address : ${controller.address}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Pincode : ${controller.pincode}",
                      style: GoogleFonts.breeSerif(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),

            //order details like order id etc...

            priceDetails(),
            const SizedBox(
              height: 10.0,
            ),

            //Make payment button
            Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 25.0),
                  decoration: BoxDecoration(
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: MaterialButton(
                    onPressed: () {
                      controller.onPay();
                    },
                    child: Text(
                      "Make Payment",
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

  Widget priceDetails() {
    Widget text(header, footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                header,
                style: GoogleFonts.aBeeZee(fontSize: 16.0),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                footer,
                style: GoogleFonts.aBeeZee(fontSize: 16.0),
              )),
        ],
      );
    }

    return Container(
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Price Details",
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.breeSerif(fontSize: 18.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            // text("Order Id : ", "sfhuierwr84w"),
            text("Delivery On : ", "12-10-2022"),
            text("Total Price : ",
                "\$ ${controller.totalPrice.toStringAsFixed(2)}"),
          ],
        ));
  }
}
