// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/controllers/cart_controller.dart';
import 'package:foodserve/models/cart_model.dart';
import 'package:foodserve/pages/address_scrren.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    // cartController.getCartData();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Text(
                    "Cart Page",
                    style: GoogleFonts.breeSerif(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: GetBuilder<CartController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.cartDataList.length,
                      itemBuilder: (context, index) {

                        var cartItems = controller.cartDataList[index];

                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(cartItems.image))),
                            title: Text(
                              cartItems.title,
                              style: GoogleFonts.breeSerif(
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Text(
                              "\$ ${cartItems.price}",
                              style: GoogleFonts.breeSerif(
                                fontSize: 20.0,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.delete,
                              color: Colors.green,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            GetBuilder<CartController>(
             
              builder: (controller) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Total Amount : -  ${controller.totalPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.breeSerif(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
            Container(
              width: 300,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(15.0)),
              child: MaterialButton(
                onPressed: () {
                  moveToAddresScreen();
                },
                child: Text(
                  "Checkout",
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

  /*Widget listViewBuilderForCart(int index, CartModel items) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(fit: BoxFit.fill, image: NetworkImage(items.image))),
        title: Text(
          items.title,
          style: GoogleFonts.breeSerif(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          "\$ ${items.price}",
          style: GoogleFonts.breeSerif(
            fontSize: 20.0,
          ),
        ),
        trailing: GestureDetector(
          onTap: () => Get.to(() => cartController
              .deleteCartItem(FirebaseAuth.instance.currentUser!.uid)),
          child: const Icon(
            Icons.delete,
            color: Colors.green,
          ),
        ),
      ),
    );
  }*/

  void moveToAddresScreen() {
    Get.to(() => AddressScrren());
  }
}
