// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:foodserve/controllers/cart_controller.dart';
import 'package:foodserve/controllers/item_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_page.dart';

class DetailsPage extends StatefulWidget {
  String id;
  String details_id;
  int index;
  DetailsPage({
    super.key,
    required this.id,
    required this.index,
    required this.details_id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int value = 1;
  CartController cartController = Get.put(CartController());
  ItemController controller = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    controller.title = controller.itemData[widget.index].title;
    controller.details_id = controller.itemData[widget.index].details_id;
    controller.price = controller.itemData[widget.index].total_price;
    controller.imageUrl = controller.itemData[widget.index].image;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back to homepage
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.arrow_back_ios)),
                    ),

                    //more about
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Badge(
                            badgeContent: Obx(
                                () => Text(cartController.count.toString())),
                            child: Icon(Icons.shopping_cart))),
                  ],
                ),
              ),
              //product image here
              GetBuilder<ItemController>(
                builder: (controller) {
                  var product = controller.itemData;
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(fit: BoxFit.fitWidth, image: NetworkImage(
                            controller.imageUrl
                              
                             )),
                        ),
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      //quantity
                      Container(
                        width: 150,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (value == 1) {
                                      return;
                                    } else {
                                      value = value - 1;
                                    }
                                  });
                                },
                                child: Text(
                                  "-",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                value.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.breeSerif(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    value = value + 1;
                                  });
                                  // int price = foodDataList[widget.index].price as int;
                                  // print(price);
                                  // price = price * value;
                                  // print(price);
                                },
                                child: Text(
                                  "+",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      //name and price details
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product[widget.index].title,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                // Text(product[widget.index].subName),
                              ],
                            ),
                            Text(
                              "\$ ${product[widget.index].total_price} ",
                              style: GoogleFonts.breeSerif(
                                  fontWeight: FontWeight.bold, fontSize: 22.0),
                            ),
                          ],
                        ),
                      ),
                      //rating  time and caleories details
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                Text(
                                  controller.itemData[widget.index].rating,
                                  style: GoogleFonts.breeSerif(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.dinner_dining_rounded,
                                  color: Colors.green,
                                ),
                                Text(
                                  "${controller.itemData[widget.index].calories} Kcal",
                                  style: GoogleFonts.breeSerif(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.green,
                                ),
                                Text(
                                  "${controller.itemData[widget.index].time} min",
                                  style: GoogleFonts.breeSerif(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      //breif about product
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          "",
                          // product[widget.index].productInfo,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.breeSerif(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      //Add to cart button
                      Container(
                        width: 300,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: MaterialButton(
                          onPressed: () {
                            controller.addToCart();
                            Get.to(() => CartPage());
                          },
                          child: Text(
                            controller.isAlreadyAvailable
                                ? "Go to Cart"
                                : "Add to Cart",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.breeSerif(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
