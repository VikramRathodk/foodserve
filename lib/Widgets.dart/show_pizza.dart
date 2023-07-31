import 'package:flutter/material.dart';
import 'package:foodserve/controllers/home_page_controller.dart';
import 'package:foodserve/controllers/item_controller.dart';
import 'package:foodserve/pages/details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowPizza extends StatelessWidget {
  ShowPizza({super.key});
  ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    controller.categoryTitle = "noodles";
    controller.categoryid = "rrnyG7Oh0EPXdy4K1q8r";
    controller.getSubCategoryData();
    return SizedBox(
      child: Expanded(
        child: GetBuilder<ItemController>(
          builder: (controller) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade100,
              ),
              height: 226,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.itemData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Get.to(()=>DetailsPage(index: index,));
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 100.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/fooddelivery-6c023.appspot.com/o/ImageFolder%2F67?alt=media&token=70041269-c433-4ed0-b652-7f78cfaef912",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Text(
                            controller.itemData[index].title,
                            // foodDataList[index].name,
                            style: GoogleFonts.breeSerif(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            controller.itemData[index].rating,
                            style: GoogleFonts.aBeeZee(
                              color: Colors.green.shade400,
                            ),
                          ),
                          Text(
                            controller.itemData[index].total_price,
                            style: GoogleFonts.aBeeZee(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
