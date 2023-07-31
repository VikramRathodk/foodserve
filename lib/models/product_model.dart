
class Products {
  late String id;
  late String category;
  late String name;
  late String subName;
  late String price;
  late String imageUrl;
  late String calories;
  late String rating;
  late String productInfo;
  late String noOfProduct;
  late String time;

  Products(
      {
    required this.id,
    required this.category,
    required this.name,
    required this.subName,
    required this.price,
    required this.imageUrl,
    required this.calories,
    required this.rating,
    required this.productInfo,
    required this.noOfProduct,
  });

  Products.fromJson(Map<String, dynamic> map) {
    id= map['id'];
    name= map['name'];
    category= map['category'];
    subName= map['subName'];
    rating= map['rating'];
    price= map['price'];
    imageUrl= map['imageUrl'];
    calories= map['calories'];
    productInfo= map['productInfo'];
    noOfProduct= map['noOfProduct'];
    time= map['time'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['subName'] = subName;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['calories'] = calories;
    data['rating'] = rating;
    data['productInfo'] = productInfo;
    data['noOfProduct'] = noOfProduct;
    data['time'] = time;
    return data;
  }
}
