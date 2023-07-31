// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodserve/models/cart_model.dart';
import 'package:foodserve/models/item_model.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  String title = "";

  final _firestore = FirebaseFirestore.instance;
  String categoryid = "";
  String details_id = '';
  String categoryTitle = "";
  String imageUrl = "";
  List<ItemModel> itemData = [];
  late ItemModel model;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  // String productId = "";

  var price;

  bool isAlreadyAvailable = false;

  // getProductIds() {
  //   productId = _firestore
  //       .collection("category")
  //       .doc(categoryid)
  //       .collection(categoryTitle)
  //       .id ;

  //   _firestore
  //       .collection("category")
  //       .doc(categoryid)
  //       .collection(categoryTitle)
  //       .doc(details_id)
  //       .get()
  //       .then((value) {
  //     model = ItemModel.formJson(value.data()!);
  //   });
  // }

  Future<void> getSubCategoryData() async {
    try {
      await _firestore
          .collection("category")
          .doc(categoryid)
          .collection(categoryTitle)
          .get()
          .then((value) {
        itemData = value.docs.map((e) => ItemModel.formJson(e.data())).toList();
      });
      // getProductIds();
      update();
    } catch (e) {
      print(e);
    }
  }

  //Add data to Firebase
  Future<void> addToCart() async {
    try {
      _firestore.collection('cart').add(CartModel(
              id: details_id,
              created_by: userId,
              image: imageUrl,
              price: price,
              title: title)
          .toMap());
      // checkIfAlreadyInCart();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkIfAlreadyInCart() async {
    try {
      await _firestore
          .collection('cart')
          .where('id', isEqualTo: details_id)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          isAlreadyAvailable = true;
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
