// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersData {
  late String orderid;
  late String img, name;
  late Timestamp deliver_on, oder_on;
  late int status;
  late String total_price;

  OrdersData(
      {required this.name,
      required this.orderid,
      required this.deliver_on,
      required this.img,
      required this.oder_on,
      required this.status,
      required this.total_price});

  OrdersData.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    img = map['img'];
    orderid = map['orderid'];
    status = map['status'];
    oder_on = map['oder_on'];
    deliver_on = map['deliver_on'];
    total_price = map['total_price'];
  }
}
