// ignore_for_file: non_constant_identifier_names

class ItemModel {
  late String id;
  late String details_id;
  late String title;
  late String calories;
  late String time;
  late String rating;
  late String total_price;
  late String image;
  late String productInfo;

  ItemModel({
    required this.id,
    required this.title,
    required this.details_id,
    required this.total_price,
    required this.image,
    required this.rating,
    required this.time,
    required this.calories,
    required this.productInfo,
  });

  ItemModel.formJson(Map<String, dynamic> map) {
    id = map['id'];
    details_id = map['details_id'];
    title = map['title'];
    total_price = map['total_price'];
    image = map['image'];
    calories = map['calories'];
    time = map['time'];
    rating = map['rating'];
    productInfo = map['productInfo'];
  }
}
