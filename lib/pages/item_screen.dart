// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodserve/controllers/item_controller.dart';
import 'package:foodserve/models/item_model.dart';
import 'package:foodserve/pages/details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemScreen extends StatelessWidget {
  String categoryId, categoryTitle;
  ItemScreen(
      {super.key, required this.categoryId, required this.categoryTitle});
  ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    controller.categoryid = categoryId;
    controller.categoryTitle = categoryTitle;
    
    controller.getSubCategoryData();

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
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    categoryTitle,
                    style: GoogleFonts.breeSerif(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //search bar
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.search),
                  Text(" Search here..."),
                ],
              ),
            ),

            //list of products
            Expanded(child: SizedBox(
              child: GetBuilder<ItemController>(
                builder: (controller) {
                  var items = controller.itemData;
                  print(
                      "no of product " + controller.itemData.length.toString());
                  return ListView.builder(
                    itemCount: controller.itemData.length,
                    itemBuilder: (context, index) {
                      return itemBuuilder(index, controller.itemData[index]);
                    },
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget itemBuuilder(int index, ItemModel items) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.mobile_friendly)),
        title: Text(
          items.title,
          style: GoogleFonts.breeSerif(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          "\$ ${items.total_price}",
          style: GoogleFonts.breeSerif(
            fontSize: 20.0,
          ),
        ),
        trailing: GestureDetector(
          onTap: () => Get.to(() => DetailsPage(
                details_id: items.details_id,
                id: categoryId,
                index: index,
              )),
          child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "Details",
                style: GoogleFonts.aBeeZee(fontSize: 14.0, color: Colors.white),
              )),
        ),
      ),
    );
  }
}
