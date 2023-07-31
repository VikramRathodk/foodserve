// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:foodserve/controllers/myorder_controller.dart';
import 'package:foodserve/models/orders_order..dart';
import 'package:foodserve/pages/order_screen_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});

  final controller = Get.put(MyOrderContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                    "My Orders",
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
            //order List
            Expanded(
              child: GetBuilder<MyOrderContoller>(
                builder: (controller) {
                  return ListView.builder(
                    
                    itemCount: controller.model.length,
                    itemBuilder: (context, index) {
                      
                      return itemViewForOrders(controller.model[index]);
                    },
                  );
                },
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  Widget itemViewForOrders(OrdersData model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        title: Text(
          "${model.name}",
          style: GoogleFonts.breeSerif(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          "${model.status}",
          style: GoogleFonts.breeSerif(
            fontSize: 14.0,
          ),
        ),
        trailing: IconButton(
            onPressed: () {
              Get.to(()=>OrderDetailsScreen(model: model,));
            },
            icon: Icon(
              Icons.more,
              color: Colors.green,
            )),
      ),
    );
  }
}
