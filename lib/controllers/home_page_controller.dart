import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodserve/models/CategoryModel.dart';
import 'package:foodserve/models/product_model.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  //instances
  final _firestore = FirebaseFirestore.instance;

  List<CategoryModel> categoryData = [];
  List<Products> productsData = [];

  //gets All category data from firebase
  Future<void> getCategoryData() async {
    await _firestore.collection('category').get().then((value) {
      categoryData =
          value.docs.map((e) => CategoryModel.fromJson(e.data())).toList();
    });
    update();
  }

  Future<void> getProducts() async {
    await _firestore.collection('products').get().then((value) {
      productsData =
          value.docs.map((e) => Products.fromJson(e.data())).toList();
    });

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
    getProducts();
  }
}
