// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodserve/controllers/home_page_controller.dart';
import 'package:foodserve/models/CategoryModel.dart';
import 'package:foodserve/models/item_model.dart';
import 'package:foodserve/pages/Search_page.dart';
import 'package:foodserve/pages/item_screen.dart';
import 'package:foodserve/pages/cart_page.dart';
import 'package:foodserve/pages/settings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Widgets.dart/show_pizza.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            //front row data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.green,
                        )),
                  ),
                  //homepage title
                  Container(
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      "mumbai,India",
                      style: GoogleFonts.breeSerif(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                          child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/personProfile.png"),
                      ))),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),

            //bannner

            Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Fastest In\nDelivery Food",
                        style: GoogleFonts.breeSerif(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Order Now",
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
                  Lottie.network(
                      "https://assets1.lottiefiles.com/packages/lf20_eop7ymay.json",
                      height: 150,
                      width: 150),
                  // Image(
                  //   image: AssetImage("assets/images/maggi.jpeg"),
                  //   height: 100,
                  //   width: 100,
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),

            //category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category ",
                    style: GoogleFonts.breeSerif(
                        // color: Colors.green.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Container(
              height: 70,
              child: GetBuilder<HomepageController>(
                builder: (controller) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        //implement onTap function here

                        onTap: () => Get.to(() => ItemScreen(
                              categoryId: controller.categoryData[index].id,
                              categoryTitle: controller.categoryData[index].name,
                              
                            )),
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10.0,
                            right: 10.0,
                            left: 10.0,
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-4, -4),
                                    color: Colors.white),
                                BoxShadow(
                                    offset: Offset(4, 4),
                                    color: Colors.grey.shade100,
                                    blurRadius: 10.0),
                              ],
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              border: Border.all(
                                width: 2.0,
                                color: Colors.grey.shade100,
                              )),
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 80,
                                  width: 60,
                                  child: Image(
                                      image: NetworkImage(
                                    controller.categoryData[index].image,
                                  ))),
                              Text(
                                controller.categoryData[index].name,
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.green.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.categoryData.length,
                  );
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),

            //popular now

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Now",
                    style: GoogleFonts.breeSerif(
                        // color: Colors.green.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                 
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),

            //popular list
            Container(
              child: ShowPizza(),
            ),
          ],
        ),
      ),
    );
  }
}
