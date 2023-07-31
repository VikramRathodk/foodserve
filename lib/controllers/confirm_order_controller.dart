import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodserve/controllers/address_controller.dart';
import 'package:foodserve/controllers/cart_controller.dart';
import 'package:foodserve/pages/navigator.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ConfirmOrderController extends GetxController {
  final addressController = Get.find<AddressScreenController>();
  final cartController = Get.find<CartController>();

  String name = "", address = "", pincode = "";

  double totalPrice = 0.0;

  //razar pay instance
  final _razorpay = Razorpay();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  initializeData() {
    name = addressController.name;
    address = addressController.address;
    pincode = addressController.pincode;
    totalPrice = cartController.totalPrice;
  }

  void onPay() {
    var options = {
      'key': 'rzp_test_0ReJfBb2BdraMd',
      'amount': totalPrice * 100,
      'name': name,
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '9921120829', 'email': 'test@razorpay.com'}
    };
    _razorpay.open(options);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    initializeData();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> placeOrder(String orderid) async {
    try {
      Map<String, dynamic> orders = {
        'orderid': orderid,
        'name': name,
        'address': address,
        'pincode': pincode,
        'mobile': _auth.currentUser!.phoneNumber,
        'time': FieldValue.serverTimestamp(),
        'status': 0,
      };
      await _firebaseFirestore.collection("order").add(orders);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addToMyOrders(String orderId) async {
    try {
      for (var i = 0; i < cartController.cartDataList.length; i++) {
        Map<String, dynamic> orderDetails = {
          'userId': _auth.currentUser!.uid,
          'img': cartController.cartDataList[i].image,
          'name': cartController.cartDataList[i].title,
          'orderid': orderId,
          'total_price': cartController.cartDataList[i].price,
          'status': 0,
          'oder_on': FieldValue.serverTimestamp(),
          'deliver_on': FieldValue.serverTimestamp(),
        };

        await _firebaseFirestore.collection('myorders').add(orderDetails);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeCartItems() async {
   await _firebaseFirestore.collection("cart").doc().delete();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    await Future.wait([
      placeOrder(response.orderId ?? ""),
      addToMyOrders(response.orderId ?? ""),
      removeCartItems()

    ]).then((value) {
      print("Payment Sucessful");

      Get.to(() => NavogatorPage());
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Erros message is : ${response.error.toString()}");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _razorpay.clear(); // Removes all listeners
  }
}
