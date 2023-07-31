// ignore_for_file: non_constant_identifier_names

class CartModel {
  late String id;
  late String created_by;
  late String title;
  late String price;
  late String image;

  CartModel(
      {required this.id,
      required this.created_by,
      required this.image,
      required this.price,
      required this.title});

  CartModel.fromJson(Map<String, dynamic> map) {
    title = map['title'];
    id = map['id'];
    created_by = map['created_by'];
    image = map['image'];
    price = map['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['created_by'] = created_by;
    data['id'] = id;
    data['image'] = image;
    data['price'] = price;
    data['title'] = title;
    return data;
  }
}
