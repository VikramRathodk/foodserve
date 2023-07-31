import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodserve/models/orders_order..dart';
import 'package:get/get.dart';

class MyOrderContoller extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  List<OrdersData> model = [];

  Future<void> getOrders() async {
    try {
      await _firestore
          .collection("myorders")
          .get()
          .then((value) {
        model = value.docs.map((e) => OrdersData.fromJson(e.data())).toList();
        update();
      });
    } catch (e) {
      print("Eroor is :::${e.toString()}");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrders();
  }
}
