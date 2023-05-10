class CategoryModel {
  final String id, title, image;
  final int numOfProducts;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.numOfProducts});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

// Our demo category
CategoryModel category = CategoryModel(
  id: "1",
  title: "Armchair",
  image: "https://i.imgur.com/JqKDdxj.png",
  numOfProducts: 100,
);
