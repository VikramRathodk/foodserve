// ignore_for_file: file_names

class CategoryModel {
  late String id;
  late String name;
  late String image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
}
/*
List<CategoryData> categoryList = [
  CategoryData(
    name: "Burger",
    animatioImageurl:
        "https://assets5.lottiefiles.com/packages/lf20_ox6npvyw.json",
    imageUrl: "https://unsplash.com/photos/_qxbJUr9RqI",
    price: "\$ 60.25",
    desc: 'Stuffed Bean.',
  ),
  CategoryData(
    name: "Pizza",
    animatioImageurl:
        "https://assets7.lottiefiles.com/packages/lf20_qknmwq75.json",
    imageUrl: "https://unsplash.com/photos/_qxbJUr9RqI",
    price: "\$ 80.50",
    desc: 'Chicago Pizza.',
  ),
  CategoryData(
    name: "Noodles",
    animatioImageurl:
        "https://assets6.lottiefiles.com/packages/lf20_LzHQb2.json",
    imageUrl: "https://unsplash.com/photos/_qxbJUr9RqI",
    price: "\$ 25.25",
    desc: 'Ramen noodle',
  )
];*/
