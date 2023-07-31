import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodserve/models/orders_order..dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrdersData model;
   OrderDetailsScreen({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back to previous page
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
                    "My Order details",
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

            //Orders details
            Column(
              children: [
                Container(
                  child: Image(
                    image: NetworkImage("${model.img}"),
                    width: 200,
                    height: 200,
                  ),
                ),
                orderDetails(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget orderDetails() {
    Widget text(header, footer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                header,
                style: GoogleFonts.aBeeZee(fontSize: 14.0),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                footer,
                style: GoogleFonts.aBeeZee(fontSize: 14.0),
              )),
        ],
      );
    }

    return Container(
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: 200,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Order Details",
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.breeSerif(fontSize: 18.0, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            text("Order Id : ", "${model.orderid.toString()}"),
            text("product name : ", "${model.name}"),
            text("Orderd Time: ", "${model.oder_on.toDate()}"),
            text("Delivery On : ", "${model.deliver_on.toDate()}"),
            text("Total Price  : ", "${model.total_price}"),
            // text("Total Price : ",
            //     "\$ ${controller.totalPrice.toStringAsFixed(2)}"),
          ],
        ));
  }
}
