
// cart update ka issue i have to solve 


// ignore_for_file: prefer_interpolation_to_compose_str
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodserve/controllers/item_controller.dart';

import 'package:foodserve/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt count = 0.obs;
  List<CartModel> cartDataList = [];
  final _fireStore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  ItemController controller = Get.put(ItemController());

  //total price
  double totalPrice = 0.0;

  //retriver data froṁ firebase firestore

  Future<void> getCartData() async {
    try {
      _fireStore
          .collection('cart')
          .where('created_by', isEqualTo: userId)
          .get()
          .then((value) {
        cartDataList =
            value.docs.map((e) => CartModel.fromJson(e.data())).toList();
        update();

        calculateTotalPrice();
      });
    } catch (e) {
      print("getdata eroor" + e.toString());
    }
  }

  void calculateTotalPrice() {
    for (var items in cartDataList) {
      totalPrice = totalPrice + double.parse(items.price);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
